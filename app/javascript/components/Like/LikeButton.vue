<template>
  <div>
    <div v-if="isLiked" @click="deleteLike()">
      いいねを取り消す {{ count }}
    </div>
    <div v-else @click="registerLike()">
      いいねする {{ count }}
    </div>
  </div>
</template>

<script>
// axios と rails-ujsのメソッドインポート
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
// CSRFトークンの取得とリクエストヘッダへの設定をしてくれます
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  // propsでrailsのviewからデータを受け取る
  props: ['userId', 'saizyId'],
  data() {
    return {
      likeList: []  // いいね一覧を格納するための変数 { id: 1, user_id: 1, saizy_id: 1 } がArrayで入る
    }
  },

  computed: {
    count() {
      return this.likeList.length
    },
    isLiked() {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }
  },
  created: function() {
    this.fetchLikeBySaizyId().then(result => {
      this.likeList = result
    })
  }, 
  methods: {
    
    // rails側のindexアクションにリクエストするメソッド
    fetchLikeBySaizyId: async function() {
      const res = await axios.get(`/api/likes/?saizy_id=${this.saizyId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerLike: async function() {
      const res = await axios.saizy('/api/likes', { saizy_id: this.saizyId })
      if (res.status !== 201) { process.exit() }
      this.fetchLikeBySaizyId().then(result => {
        this.likeList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteLike: async function() {
      const likeId = this.findLikeId()
      const res = await axios.delete(`/api/likes/${likeId}`)
      if (res.status !== 200) { process.exit() }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
    findLikeId: function() {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.userId)
      })
      if (like) { return like.id }
    }
  }
}

</script>