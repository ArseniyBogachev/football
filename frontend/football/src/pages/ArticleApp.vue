<template>
  <MyLoading v-if="loading"></MyLoading>
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
import MyLoading from "@/components/UI/MyLoading";
import {mapGetters, mapActions} from 'vuex'
export default {
  name: "ArticleApp",
  components:{
    ArticleMob,
    ArticleCom,
    MyLoading,
  },
  mounted() {
    this.category_data()
    this.articles_data()
  },
  methods:{
    ...mapActions({
      category_data: 'category_data',
      articles_data: 'articles_all_data',
    }),
  },
  computed:{
    ...mapGetters({
      category: 'category',
      loading: 'loading',
    })
  }
}
</script>

<style scoped>

</style>
