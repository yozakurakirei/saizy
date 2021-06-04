// vue practice
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#practice',
    data: {
      message: "Vue.js practicing!!"
    },
    components: { App }
  })
})