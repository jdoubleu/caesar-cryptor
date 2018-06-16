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
                  <label for="plaintext">Plaintext</label>
                  <textarea id="plaintext" class="form-control" rows="8" v-model="plaintext"></textarea>
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
                  <label for="ciphertext">Ciphertext</label>
                  <textarea id="ciphertext" class="form-control" rows="8" readonly v-model="ciphertext"></textarea>
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

      plaintext: '',
    }
  },
  computed: {
    ciphertext() {
      const cipherfunc = lib[this.cipher + '_' + this.mode + '_enc'];

      return cipherfunc(this.plaintext, this.key, this.iv);
    }
  },
  watch: {
    plaintext(value, oldValue) {
      if (!/^[a-zA-Z]*$/.test(value)) {
        this.plaintext = oldValue;
      }
    }
  }
}
</script>

<style lang="scss">
</style>
