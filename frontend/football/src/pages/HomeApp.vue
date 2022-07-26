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
import {mapActions } from 'vuex'
export default {
  name: "HomeApp",
  data(){
    return{
      search: '',
      like: false,
      dislike: false,
      like_count: 0,
      dislike_count: 0,
    }
  },
  components:{
    NewsApp,
  },
  methods:{
    like_func(){
      if (this.like === this.dislike){
        this.like = !this.like
        this.like_count += 1
      }
      else{
        if (this.like === true){
          this.like = false
          this.like_count -= 1
        }
        else{
          this.like = !this.like
          this.like_count += 1
          this.dislike = !this.dislike
          this.dislike_count -= 1
        }
      }
    },
    dislike_func(){
      if (this.like === this.dislike){
        this.dislike = !this.dislike
        this.dislike_count += 1
      }
      else{
        if (this.dislike === true){
          this.dislike = false
          this.dislike_count -= 1
        }
        else{
          this.like = !this.like
          this.like_count -= 1
          this.dislike = !this.dislike
          this.dislike_count += 1
        }
      }
    }
  },
  created() {
    this.$store.dispatch('articles_data')
  },
  computed:{
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