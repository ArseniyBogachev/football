<template>
  <ArticleCom class="d-none d-lg-block"
              v-bind:category="category"
  ></ArticleCom>
  <ArticleMob class="d-lg-none"
              v-bind:category="category"
  ></ArticleMob>
</template>
<script>
import ArticleMob from "@/components/ArticleMob";
import ArticleCom from "@/components/ArticleCom";
export default {
  name: "ArticleApp",
  components:{
    ArticleMob,
    ArticleCom,
  },
  data(){
    return{
      category: [
        {name: 'All', link: 'all', photo: 'all.jpg'},
        {name: 'Tactical articles', link: 'tactical', photo: 'tactical.jpg'},
        {name: 'Articles about player', link: 'player', photo: 'player.jpg'},
        {name: 'Articles about XG', link: 'xg', photo: 'xg2.webp'},
        {name: 'Articles about managers', link: 'manager', photo: 'manager.jpg'},
        {name: 'Articles about team', link: 'team', photo: 'team.jpg'},
      ],
    }
  },
}
</script>

<style scoped>

</style>
