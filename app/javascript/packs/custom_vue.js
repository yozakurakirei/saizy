// ローカルストレージへ保存
// https://jp.vuejs.org/v2/examples/todomvc.html
var STORAGE_KEY = 'todos-vuejs-demo'
var todoStorage = {
  fetch: function() {
    var todos = JSON.parse(
      localStorage.getItem(STORAGE_KEY) || '[]'
    )
    todos.forEach(function(todo, index) {
      todo.id = index
    })
    todoStorage.uid = todos.length
    return todos
  },
  save: function(todos) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(todos))
  }
}

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      // 使用するデータ
      todos: []
    },
    methods: {
      // 使用するメソッド
      doAdd: function(event, value) {
        const comment = this.$refs.comment
        if (!comment.value.length) {
          return
        }
        this.todos.push({
          id: todoStorage.uid++,
          comment: comment.value,
          state: 0
        })
        // フォームをからにする
        comment.value = ""
      }
    },
    components: { App }
  })
})