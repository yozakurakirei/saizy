import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  const area = new Vue({
    el: "#area_list",
    data: {
      list: [
        { id: 1, areaName: "東京都", imageSrc: '/sinjyuku.jpeg' },
        { id: 1, areaName: "神奈川県", imageSrc: './media/images/yokohama.jpeg' }
      ],
      count: 3,
    },
    computed: {
      listItems() {
        const list = this.list
        return list.slice(0, this.count)
      }
    },
    methods: {
      isMore() {
        this.count += 3
      }
    }
  }) 
});
