<script>
export default {
  el: '#contents',
  data: {
    isActive: 'A'
  },
  methods: {
    change: function(num){
      this.isActive = num
    }
  }
}
</script>