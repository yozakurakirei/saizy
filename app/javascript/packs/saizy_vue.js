// saizy用vue
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#saizy',
    data: {
      message: "聞こえますか？これはsaizy.vue.jsからです"
    },
    components: { App }
  })

  const single = new Vue({
    el: "#single-preview",
    data: function() {
      return {
        preview: null,
        image: null,
        preview_list: [],
        image_list: []
      };
    },
    methods: {
      previewImage: function(event) {
        const input = event.target;
        if (input.files) {
          const reader = new FileReader();
          reader.onload = (e) => {
            this.preview = e.target.result;
          }
          this.image=input.files[0];
          reader.readAsDataURL(input.files[0]);
        }
      },
      previewMultiImage: function(event) {
        const input = event.target;
        const count = input.files.length;
        const index = 0;
        if (input.files) {
          while(count --) {
            const reader = new FileReader();
            reader.onload = (e) => {
              this.preview_list.push(e.target.result);
            }
            this.image_list.push(input.files[index]);
            reader.readAsDataURL(input.files[index]);
            index ++;
          }
        }
      },
      reset: function() {
        this.image = null;
        this.preview = null;
        this.image_list = [];
        this.preview_list = [];
      }
    }
  });
  
})