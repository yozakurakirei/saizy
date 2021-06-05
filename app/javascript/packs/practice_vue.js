// vue practice
import Vue from 'vue/dist/vue.esm'
import Practice from '../vue_practice/practice.vue'

document.addEventListener('DOMContentLoaded', () => {

  // const app4 = new Vue({
  //   el: "#app4",
  //   data: {
  //     todos: [
  //       { text: "パーソルイノベーション" },
  //       { text: "パーソルキャリア" },
  //       { text: "パーソルプロセスアンドテクノロジーズ" }
  //     ]
  //   }
  // })

  const app5 = new Vue({
    el: "#app5",
    data: {
      message: "パーソルイノベーション"
    },
    methods: {
      reverseMessage: function() {
        this.message = this.message.split('').reverse().join('')
      }
    }
  })

  Vue.component('todo-item', {
    props: ['todo'],
    template: "<li>{{ todo.text }}</li>"
  })
  
  // new Vue でインスタンスが作れて起動できる
  const app6 = new Vue({
    el: "#app6",
    data: {
      groceryList: [
        { id: 0, text: "AUBA" },
        { id: 1, text: "TOMORUBA" },
        { id: 2, text: "ミイダス" },
      ]
    }
  })
  
  // data object
  // const data = { a: 1 }
  
  // // add object
  // const vm = new Vue ({
  //   data: data
  // })

  // console.log(vm.a == data.a)
  // data.a = 2
  // console.log(vm.a)
  // console.log(data.a)

  // const obj = {
  //   foo: "bar"
  // }

  // Object.freeze(obj)

  // new Vue ({
  //   el: "#app7",
  //   data: obj
  // })

  const data = { a:1 }
  const vm = new Vue ({
    el: "#example",
    data: data
  })

  console.log(vm.$data ===  data) 
  console.log(vm.$el === document.getElementById("example") )


  new Vue ({
    data: {
      a: 10
    },
    created: function() {
      console.log("a is: " + this.a)
    }
  })

  // インスタンスプロパティにはアロー関数は使えない

  const transition0 = new Vue({
    el: "#anime1",
    data: {
      show: true
    }
  })

  new Vue ({
    created: function() {  // インスタンス作成後、すぐに実行される処理
      console.log('すぐに呼び出される')
    }
  })
})