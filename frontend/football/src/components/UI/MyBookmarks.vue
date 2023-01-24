<template>
    <a href="#" v-if="this.arr_id.includes(this.article.id) && verify" v-on:click.prevent="bookmarks_false(this.article.id)">
      <fa icon="fa-solid fa-bookmark" style="color: #216bff"></fa>
    </a>
    <a href="#" v-else v-on:click.prevent="bookmarks_true(this.article.id)">
      <fa icon="fa-solid fa-bookmark" style="color: black"></fa>
    </a>
</template>

<script>
import {mapActions, mapGetters} from 'vuex'
export default {
  name: "MyBookmarks",
  props:{
    article: Object,
    arr_id: Array,
  },
  methods:{
    ...mapActions({
      bookmarks_false: 'bookmarks_false',
      bookmarks_true: 'bookmarks_true',
    })
  },
  computed:{
    ...mapGetters({
      verify: 'verify',
      // me: 'me',
    }),
    // bookmarks(){
    //   let result = []
    //   console.log([...this.me.bookmarks].map(item => item.id))
    //   console.log([...this.me.bookmarks])
    //   for (let i of this.me.bookmarks){
    //     result.push(i.id)
    //   }
    //   return result
    // }
  }
}
</script>

<style scoped>

</style>