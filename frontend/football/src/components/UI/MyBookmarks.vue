<template>
    <a href="#" v-if="this.me.bookmarks.includes(this.article.id) && verify" v-on:click.prevent="bookmarks_false(this.article.id)">
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
      me: 'me',
    }),
  }
}
</script>

<style scoped>

</style>