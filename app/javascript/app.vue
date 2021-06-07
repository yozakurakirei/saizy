
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
  font-size: 1.5rem;
  text-align: center;
  color: #42B983;
}
</style>