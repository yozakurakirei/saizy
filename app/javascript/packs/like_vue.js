// // いいねボタン

// import Vue from 'vue/dist/vue.esm'

// const VueStar = window['VueStar'];
// document.addEventListener('DOMContentLoaded', () => {
//   Vue.component('VueStar', VueStar) 
//   // いいねボタン
//   const like = new Vue ({
//     el: '#like',
//     mounted: function(){
//       this.$refs.ThumbsUp.$data.active = true;
//       console.log(this.$refs.ThumbsUp.$data);
//     },
//     methods: {
//       handleClick () {
//         console.log(this.$refs.ThumbsUp.$data);
//         //do something
//       }
//     }
//   })
// })