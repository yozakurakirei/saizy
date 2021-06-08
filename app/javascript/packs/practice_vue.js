// vue practice
import Vue from 'vue/dist/vue.esm'
import Practice from '../vue_practice/practice.vue'
// import ComTest from '../components/comTest.vue'


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
      message: "やまもとやまののり"
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
        { id: 0, text: "apple" },
        { id: 1, text: "lemon" },
        { id: 2, text: "orange" },
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

  // ちょっとjs bind
  const myButton = {
    content: "OK!",
    click() {
      console.log(this)
      console.log(this.content + "クリックしました")
    },
  }

  const yourButton = {
    content: "No!!"
  }
  

  const boundClick = myButton.click.bind(yourButton);
  boundClick();


  const userOne = {
    firstName: "ゆい",
    lastName: "新垣"
  }
  const userTwo = {
    firstName: "りほ",
    lastName: "吉岡"
  }

  const fullName = function() {
    return `$(this.lastName), $(this.firstName)`;
  }
  
  const name1 = fullName.bind(userOne);
  const name2 = fullName.bind(userTwo)

  // vue に戻りました
  const store = { count: 0 }
  const app10 = new Vue ({
    el: "#app10",
    data: {
      store: store
    }
  }) 
  store.count++

  new Vue ({
    el: "#app11",
    data: {
      message: {
        value: "Saizyの世界へようこそ！！"
      },
      list: ["堂島ロール", "伊藤久右衛門", "おむすびケーキ"],
      num: 0
    }
  })
  
  new Vue ({
    el: "#app12",
    data: {
      count: 0
    },
    methods: {
      click_count() {
        this.count += 1
      }
    }
  })

  // Still working on this

  new Vue({
    el: "#app13",
    
    template: "#slidemenu",
    
    data: {
        open: false
    },
    
    methods: {
        toggleNav: function() {
            this.open = !this.open
            this.$emit('toggle', this.open)
        }
    }
  })

  new Vue({
    el: "#app14",
    data: {
      isChild: false,
      isActive: true,
      textColor: 'red',
      bgColor: 'lightgray'
    }
  })

  new Vue({
    el: "#app15",
    data: {
      radius: 50
    }
  })

  // 切り替え頻度が高いものはv-showを使用する
  // 内側にディレクティブやコンポーネントが多用されていたらv-if
  new Vue({
    el: "#app16",
    data: {
      ok: true
    }
  })
   
  new Vue({
    el: "#app17",
    data: {
      list: [
        { id: 1, name: "react", hp: 1000 },
        { id: 2, name: "dart", hp: 2000 },
        { id: 3, name: "vue", hp: 100 },
      ]
    },
    mounted: function () {
      console.log(this.$el)
     }
  })

  new Vue({
    el: "#app18",
    mounted: function () {
      console.log(this.$refs.hello)
    }
  })

  new Vue ({
    el: "#app19",
    data: {
      show: true
    },
    methods: {
      handleClick() {
        const count = this.$refs.count
        if (count) {
          count.innerText = parseInt(count.innerText, 10) + 1
        }
      }
    }
  })

  new Vue ({
    el: "#app20",
    data: {
      message: "v-textで描画しています",
    },
    mounted: function() {
      console.log(this.$el)
    }
  })

  new Vue ({
    el: "#app21",
    methods: {
      handleClick: function() {
        alert("クリックしたよ(ｏ'∀')ﾉ")
      }
    }
  })

  new Vue ({
    el: "#app23",
    data: {
      message: "input要素だよ",
    },
    methods: {
      handleInput: function(event) {
        this.message = event.target.value
      }
    }
  })

  new Vue ({
    el: "#app24",
    methods: {
      handler: function(comment) {
        console.log(comment)
      }
    }
  }) 

  // コンポーネント
  Vue.component('app26', {
    template: '<p>私のコンポーネント</p>'
  })
  
  new Vue({
    el: 'app26'
  })

  new Vue({
    el: 'hello-temp',
    components: { HelloTemp }
  })
})