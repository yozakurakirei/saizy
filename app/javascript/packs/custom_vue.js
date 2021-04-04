import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      number:0, 
      items: [1,2,3],
      color: 'blue',
    },
    methods: {
      countUp:function(){
        this.number = this.number + 1
      }
    },
    computed: {
      custom_color:function(){
        return this.color.toUpperCase();
      }
    }
  })
})
