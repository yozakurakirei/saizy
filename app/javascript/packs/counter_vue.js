import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#counter',
    data: {
      message: "頑張って面接合格するぞ！",
      myText: ''
    },
    computed: {
      remaining: function() {
        return 300 - this.myText.length;
      },
      
    }
  })
})