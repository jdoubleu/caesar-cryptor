<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <span class="navbar-brand mb-0 h1">Caesar Cryptor</span>
    </nav>

    <main class="container mt-4 mb-4 pb-5">
      <crypt/>
      <attack/>
    </main>

    <footer id="main-footer">
      <div class="container">
        <div class="row">
          <p class="col text-muted">Written with VueJS. Licensed under MIT.</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css'
import Crypt from './components/Crypt.vue'
import Attack from './components/Attack.vue'

export default {
  name: 'app',
  data () {
    return {}
  },
  components: {
    Crypt,
    Attack
  }
}
</script>

<style lang="scss">
#main-footer {
  position: fixed;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 60px;
  line-height: 60px; /* Vertically center the text there */
  background-color: #f5f5f5;
  z-index: 200;
}

.row {
  margin-bottom: 20px;

  &:last-child {
    margin-bottom: 0;
  }
}
</style>
