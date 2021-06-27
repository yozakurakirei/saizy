// いいねボタン

import Vue from 'vue/dist/vue.esm'

import LikeButton from '../components/Like/LikeButton.vue'

document.addEventListener('DOMContentLoaded', () => {
    // いいねボタン
    new Vue ({
      el: '#like',
      components: {
        LikeButton
      },
    })
})