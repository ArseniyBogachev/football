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
import {mapGetters, mapActions} from 'vuex'
export default {
  name: "ArticleApp",
  components:{
    ArticleMob,
    ArticleCom,
  },
  created() {
    this.category_data()
  },
  methods:{
    ...mapActions({
      category_data: 'category_data'
    }),
  },
  computed:{
    ...mapGetters({
      category: 'category',
    })
  }
}
</script>

<style scoped>

</style>
