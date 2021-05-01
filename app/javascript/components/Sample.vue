<template>
  <div id="sample">
    <nav>
      <div class="menu-item"><a href="/about">ランキング</a></div>
      <div class="menu-item"><a href="#">すべてのアイテム</a></div>
      <div class="menu-item"><a href="#">投稿する</a></div>
    </nav>
    <p><button v-on:click="show=!show">切り替え</button></p>
    <transition>
      <div v-show="show">
        トランジションさせたい要素
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      show: true
    }
  }
}
</script>

<style lang="scss" scoped>
nav {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #f8f8f8;
}
.menu-item {
  color: #555;
  padding: 20px 20px;
}

.v-enter-active,
.v-leave-active {
  transition: opacity 1s;
}

.v-enter,
.v-leave-to {
  opacity: 0;
}

p {
  margin: 10px;
}
button {
  padding: 10px;
}
</style>