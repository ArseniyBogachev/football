<template>
  <MyForm v-on:article_fn="article_create"></MyForm>
</template>

<script>
import {mapActions} from 'vuex';
import MyForm from "@/components/UI/MyForm";
export default {
  name: "CreatearticlesApp",
  props: {
    slug: String,
  },
  components:{
    MyForm,
  },
  methods:{
    ...mapActions({
      article_create: 'article_create',
    }),
  },
}
</script>

<style scoped>

</style>