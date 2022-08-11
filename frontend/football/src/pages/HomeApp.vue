<template>
  <div class="container-md d-none d-md-block">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:bookmarks="me.bookmarks"
      ></NewsApp>
    </ul>
  </div>
  <div class="wrapper-sm d-md-none">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:bookmarks="me.bookmarks"
      ></NewsApp>
    </ul>
  </div>
</template>


<script>
import NewsApp from "@/components/NewsApp";
import {mapGetters, mapActions} from 'vuex'
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
  created() {
    this.articles_data()
    this.me_data(localStorage.getItem('access'))
  },
  computed:{
    ...mapGetters({
      me: 'me',
      articles: 'articles_all',
      category: 'category'
    }),
  },
  methods:{
    ...mapActions({
      me_data: 'me_data',
      articles_data: 'articles_data'
    }),
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
    min-height: 80em;
  }
  ul{
    list-style: none;
  }
  .wrapper-sm{
    padding: 2%;
    min-height: 80em;
  }
</style>