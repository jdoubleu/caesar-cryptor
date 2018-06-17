<template>
  <div class="row">
    <div class="col">
      <div class="card">
        <div class="card-header">
          <h1 class="card-title">Ciphertext-Only Attack</h1>
          <h5 class="card-title text-muted">On Caesar-CBC.</h5>
        </div>
        <div class="card-body">
          <form>
            <div class="form-row">
              <div class="form-group col">
                <label for="inputtext">Ciphertext</label>
                <textarea id="inputtext" class="form-control" rows="8" v-model="inputtext"></textarea>
              </div>
            </div>
             <div class="form-row">
              <div class="form-group col">
                <label for="outputtext">Plaintext <small>(Variant {{variant + 1}})</small></label>
                <textarea id="outputtext" class="form-control" rows="8" v-model="outputtext" readonly></textarea>
              </div>
            </div>
          </form>
          <hr/>
          <div class="row">
            <div class="col">
              <table class="table table-responsive">
                <thead>
                  <th>Letter frequency</th>
                  <th>Ciphertext</th>
                  <th>Difference</th>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <table class="table-hover table-bordered table-sm text-center">
                        <caption>From Beutelspacher, Albrecht (2005). Kryptologie (7 ed.). Wiesbaden: Vieweg. p. 10. ISBN 3-8348-0014-7.</caption>
                        <thead>
                          <th>Char</th>
                          <th>Freq</th>
                        </thead>
                        <tbody>
                          <tr v-for="(freq, char) in germanAlphabet" v-bind:key="char">
                            <td>{{char}}</td>
                            <td>{{freq}}</td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                    <td>
                      <table class="table-hover table-bordered table-sm text-center">
                        <thead>
                          <th>Char</th>
                          <th>Freq</th>
                          <th>Use</th>
                        </thead>
                        <tbody>
                          <tr v-for="(freq, char, index) in inputLetters" v-bind:key="char">
                            <td>{{char}}</td>
                            <td>{{freq}}</td>
                            <td>
                              <input type="radio" name="variants" :value="index" v-model="variant"/>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                    <td>
                      <table class="table-hover table-bordered table-sm text-center">
                        <thead>
                          <th>Char</th>
                          <th>Diff</th>
                        </thead>
                        <tbody>
                          <tr v-for="(freq, char, index) in letterDiff" v-bind:key="char">
                            <td>{{char}}</td>
                            <td>{{freq}}
                              <small v-if="index == 0">
                                🔑
                              </small>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { german as germanAlphabet } from '../lib/alphabet.js'
import * as lib from '../lib/crypt.js'

const _A = 'A'.charCodeAt(0);

export default {
  name: 'attack',
  data () {
    return {
      germanAlphabet: germanAlphabet,

      inputtext: '',

      variant: 0
    }
  },
  computed: {
    inputLetters() {
      let letters = {};

      this.inputtext.replace(/\s/g, '')
        .split('')
        .forEach(c => {
          if (!letters[c]) letters[c] = 0;
          letters[c]++;
        });

      let sorted = Object.keys(letters)
        .map(c => [c, letters[c]])
        .sort((a,b) => b[1] - a[1]);

      letters = {};
      sorted.forEach(c => letters[c[0]] = c[1]);

      return letters;
    },
    letterDiff() {
      let diff = {};

      if (this.inputtext) {
        const alphabet = Object.keys(germanAlphabet);
        const cipher = Object.keys(this.inputLetters);

        const [tmp] = cipher.splice(this.variant, 1);
        cipher.unshift(tmp);

        cipher.forEach((l, i) => {
          const left = alphabet[i].charCodeAt(0) - _A;
          const right = l.charCodeAt(0) - _A;

          diff[l + ' - ' + alphabet[i]] = (26 + right - left) % 26;
        });
      }

      return diff;
    },
    outputtext() {
      const diffMap = this.letterDiff;
      const key = diffMap[Object.keys(diffMap)[this.variant]];

      return lib.caesar_ecb_dec(this.inputtext, key);
    }
  },
  watch: {
    inputtext(value, oldValue) {
      if (!/^[a-zA-Z\s]*$/.test(value)) {
        this.inputtext = oldValue;
      }
    }
  }
}
</script>

<style lang="scss">
</style>
