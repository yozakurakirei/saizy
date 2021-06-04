<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      message: "こんにちはVueです(ｏ'∀')ﾉ"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2rem;
  text-align: center;
  color: red;
}
</style>