// saizy用vue
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#saizy',
    data: {
      message: "聞こえますか？これはsaizy.vue.jsからです"
    },
    components: { App }
  })
})