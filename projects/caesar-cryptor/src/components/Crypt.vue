<template>
  <div>
    <div class="row">
      <div class="col">
        <div class="card">
          <h1 class="card-header">Caesar Cipher</h1>
          <div class="card-body">
            <form>
              <div class="form-row">
                <div class="form-group col-md-5">
                  <label for="inputtext">Plaintext</label>
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
                  <div class="form-row">
                  </div>
                </div>
                <div class="form-group col-md-5">
                  <label for="outputtext">Ciphertext</label>
                  <textarea id="outputtext" class="form-control" rows="8" readonly v-model="outputtext"></textarea>
                </div>
                <div class="form-group">
                  <button type="button" class="btn btn-success">🔒 Encrypt</button>
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
      cipher: 'caesar',
      mode: 'ecb',
      key: 1,
      iv: 0,

      inputtext: '',
    }
  },
  computed: {
    outputtext() {
      const cipherfunc = lib[this.cipher + '_' + this.mode + '_enc'];

      return this.inputtext ? cipherfunc(this.inputtext, this.key, this.iv) : '';
    }
  },
  watch: {
    inputtext(value, oldValue) {
      if (!/^[a-zA-Z]*$/.test(value)) {
        this.inputtext = oldValue;
      }
    }
  }
}
</script>

<style lang="scss">
</style>
