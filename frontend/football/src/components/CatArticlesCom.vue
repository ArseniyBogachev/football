<template>
  <div class="container-md">
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
import {mapGetters} from 'vuex'
export default {
  name: "CatArticlesCom",
  components:{
    NewsApp,
  },
  props:{
    slug: {
      type: String,
    },
  },
  methods:{

  },
  created() {
    this.$store.dispatch('articles_data')
  },
  computed:{
    ...mapGetters({
        articles_all: 'articles_all',
        articles_tactical: 'articles_tactical',
        articles_player: 'articles_player',
        articles_xg: 'articles_xg',
        articles_manager: 'articles_manager',
        articles_team: 'articles_team',
    }),
    articles(){
      if (this.slug === 'all') {
        return this.articles_all
      }
      else if (this.slug === 'tactical') {
        return this.articles_tactical
      }
      else if (this.slug === 'player') {
        return this.articles_player
      }
      else if (this.slug === 'xg') {
        return this.articles_xg
      }
      else if (this.slug === 'manager') {
        return this.articles_manager
      }
      else {
        return this.articles_team
      }
    }
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
    min-height: 658px;
  }
  ul{
    list-style: none;
  }
  .wrapper-sm{
    padding: 2%;
  }
</style>