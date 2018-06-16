<template>
  <div>
    <div class="row">
      <div class="col">
        <div class="card">
          <div class="card-header">
            <h1 class="card-title float-left">Caesar Cipher</h1>
            <div class="btn-group float-right" role="group" aria-label="Operation">
              <button type="button" :class="{'btn': true, 'btn-success': opEncrypt, 'btn-outline-success': !opEncrypt}" @click="toggleOp(true)">{{ buttonLabels[1] }}</button>
              <button type="button" :class="{'btn': true, 'btn-danger': !opEncrypt, 'btn-outline-danger': opEncrypt}" @click="toggleOp(false)">{{ buttonLabels[0] }}</button>
            </div>
          </div>
          <div class="card-body">
            <form>
              <div class="form-row">
                <div class="form-group col-md-5">
                  <label for="inputtext">{{ textLabels[!opEncrypt & 1] }}</label>
                  <textarea id="inputtext" class="form-control" rows="8" v-model="inputtext"></textarea>
                </div>
                <div class="form-group col-md-2">
                  <div class="form-row">
                    <div class="form-group col-12">
                      <label for="cipher-method">Cipher</label>
                      <select id="cipher-method" class="form-control" v-model="cipher">
                        <option value="caesar">Caesar</option>
                      </select>
                    </div>
                    <div class="form-group col-12">
                      <label for="block-mode">Block Mode</label>
                      <select id="block-mode" class="form-control" v-model="mode">
                        <option value="ecb">ECB</option>
                        <option value="cbc">CBC</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-sm-6">
                      <label for="key">Key</label>
                      <input id="key" class="form-control" type="number" min="1" max="25" v-model="key"/>
                    </div>
                    <div class="form-group col-sm-6">
                      <template v-if="mode == 'cbc'">
                        <label for="iv">IV</label>
                        <input id="iv" class="form-control" type="number" min="0" max="25" v-model="iv"/>
                      </template>
                    </div>
                  </div>
                </div>
                <div class="form-group col-md-5">
                  <label for="outputtext">{{ textLabels[opEncrypt & 1] }}</label>
                  <textarea id="outputtext" class="form-control" rows="8" readonly v-model="outputtext"></textarea>
                </div>
                <div class="form-group text-right align-right col">
                  <button type="button" class="btn btn-primary">{{ buttonLabels[opEncrypt & 1] }}</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import * as lib from '../lib/crypt.js'

export default {
  name: 'crypt',
  data () {
    return {
      textLabels: ['Plaintext', 'Ciphertext'],
      buttonLabels: ['🔓 Decrypt', '🔒 Encrypt'],

      opEncrypt: true,

      cipher: 'caesar',
      mode: 'ecb',
      key: 1,
      iv: 0,

      inputtext: '',
    }
  },
  computed: {
    outputtext() {
      const cipherfunc = lib[this.cipher + '_' + this.mode + (this.opEncrypt ? '_enc' : '_dec')];

      return this.inputtext ? cipherfunc(this.inputtext, this.key, this.iv) : '';
    }
  },
  watch: {
    inputtext(value, oldValue) {
      if (!/^[a-zA-Z\s]*$/.test(value)) {
        this.inputtext = oldValue;
      }
    }
  },
  methods: {
    toggleOp(val) {
      const oldValue = this.opEncrypt;
      this.opEncrypt = !!val;

      if (oldValue != !!val) {
        this.inputtext = this.outputtext;
      }
    }
  }
}
</script>

<style lang="scss">
</style>
