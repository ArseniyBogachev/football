<template>
  <MyForm v-bind:id="article_find.id"
          v-model:text="article_find.text"
          v-model:title="article_find.title"
          v-model:selected_sort="article_find.cat"
          v-on:article_fn="article_update"
  ></MyForm>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import MyForm from "@/components/UI/MyForm";
export default {
  name: "UpdatearticlesApp",
  components:{
    MyForm,
  },
  props:{
    user: String,
    article: String,
  },
  methods:{
    ...mapActions({
      article_update: 'article_update',
    }),
  },
  computed:{
    ...mapGetters({
      articles_all: 'articles_all',
      me: 'me',
    }),
    article_find(){
      return [...this.me.my_articles].find(item => item.title === this.article)
    }
  }
}
</script>

<style scoped>

</style>