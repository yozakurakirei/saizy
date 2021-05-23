<template>
  <div id="app">
    <h1>{{ message }}</h1>
  </div>
</template>

<script>
import Sample from './components/Sample.vue'
import PostTab from './components/PostTab'
export default {
  components: {
    Sample,
    PostTab
  },
  data: function() {
    return {
      message: "こんにちはVueです(ｏ'∀')ﾉ"
    }
  }
}
</script>

<style scoped>
</style>