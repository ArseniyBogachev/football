<template>
  <div class="container-md d-none d-md-block">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
      ></NewsApp>
    </ul>
  </div>
  <div class="wrapper-sm d-md-none">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
      ></NewsApp>
    </ul>
  </div>
</template>


<script>
import NewsApp from "@/components/NewsApp";
import {mapGetters, mapMutations, mapActions} from 'vuex'
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
  // methods:{
  //   ...mapActions({
  //     like_fn: 'like_fn',
  //     dislike_fn: 'dislike_fn'
  //   }),
  // },
  created() {
    this.$store.dispatch('articles_data', localStorage.getItem('access'))
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