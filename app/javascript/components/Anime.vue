<template>
  <div id="anime">
    <div class="tabs">
      <TabItem v-for="item in list" v-bind="item"
               :key="item.id" v-model="currentId" />
    </div>
    <div class="contents">
      <transition>
        <section class="item" :key="currentId">
          {{ current.content }}
        </section>
      </transition>
    </div>
  </div>
</template>

<script>
import TabItem from './TabItem'

export default {
  components: {
    TabItem
  },
  data () {
    return {
      currentId: 1,
      list: [
        { id: 1, label: "Saizyとは", content: "期間限定ショップ専門投稿サイトです" },
        { id: 2, label: "催事とは", content: "期間限定ショップ、POPUPなど期間を定めているショップです" },
        { id: 3, label: "開発環境", content: "Ruby on Rails + Vue.js" },

      ]
    }
  },
  computed: {
    current () {
      return  this.list.find(el => el.id === this.currentId) || {}
    }
  }
}
</script>

<style lang="scss" scoped>
  #anime {
    margin: 20px;
  }
  .contents {
    position: relative;
    overflow: hidden;
    width: 280px;
    border: 1px solid #333;
  }
  .item {
    box-sizing: border-box;
    padding: 10px;
    width: 100%;
    transition: all 0.8s ease-out;
  }

  // transition
  .v-leave-active {
    position: absolute;
  }

  .v-enter {
    transform: translateY(-100%);
  }
  .v-leave-to {
    transform: translateY(100%);
  }
</style>