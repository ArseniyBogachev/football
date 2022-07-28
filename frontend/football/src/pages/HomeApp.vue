<template>
  <div class="container-md d-none d-md-block">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:like="like"
          v-bind:dislike="dislike"
          v-bind:like_count="like_count"
          v-bind:dislike_count="dislike_count"
          v-on:like_func="like_func"
          v-on:dislike_func="dislike_func">
      </NewsApp>
    </ul>
  </div>
  <div class="wrapper-sm d-md-none">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:like="like"
          v-bind:like_count="like_count"
          v-bind:dislike_count="dislike_count"
          v-bind:dislike="dislike"
          v-on:like_func="like_func"
          v-on:dislike_func="dislike_func">
      </NewsApp>
    </ul>
  </div>
</template>


<script>
import NewsApp from "@/components/NewsApp";
import {mapGetters, mapMutations} from 'vuex'
export default {
  name: "HomeApp",
  data(){
    return{
      search: '',
    }
  },
  components:{
    NewsApp,
  },
  methods:{
    ...mapMutations({
      like_func: 'like_func',
      dislike_func: 'dislike_func',
    }),
  },
  created() {
    this.$store.dispatch('articles_data')
  },
  computed:{
    ...mapGetters({
        like: 'like',
        dislike: 'dislike',
        like_count: 'like_count',
        dislike_count: 'dislike_count',
    }),
    articles(){
      return [...this.$store.getters.articles_all,]
    }
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
  }
  ul{
    list-style: none;
  }
  .wrapper-sm{
    padding: 2%;
  }
</style>