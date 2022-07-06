<template>
  <ArticleCom class="d-none d-lg-block"></ArticleCom>
  <ArticleMob class="d-lg-none"></ArticleMob>
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
}
</script>

<style scoped>

</style>