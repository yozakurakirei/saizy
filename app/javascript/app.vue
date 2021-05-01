<template>
  <div id="app">
    <p>{{ message }}</p>
    <Sample></Sample>
  </div>
</template>

<script>
import Sample from './components/Sample'
export default {
  data () {
    return {
    }
  },
  components: {
    Sample
  }
}
</script>

<style lang="scss" scoped>
  p {
  font-size: 2em;
  text-align: center;
  }
</style>
