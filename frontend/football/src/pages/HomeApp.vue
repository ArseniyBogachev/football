<template>
  <MyLoading v-if="loading"></MyLoading>
  <div class="container-md d-none d-md-block">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:arr_id="arr_id"
      ></NewsApp>
    </ul>
  </div>
  <div class="wrapper-sm d-md-none">
    <ul>
      <NewsApp
          v-for="n in articles"
          v-bind:n="n"
          v-bind:arr_id="arr_id"
      ></NewsApp>
    </ul>
  </div>
  <div ref="observer" class="observer"></div>
</template>


<script>
import NewsApp from "@/components/NewsApp";
import {mapGetters, mapActions} from 'vuex'
import MyLoading from "@/components/UI/MyLoading";
export default {
  name: "HomeApp",
  data(){
    return{
      search: '',
    }
  },
  components:{
    MyLoading,
    NewsApp,
  },
  computed:{
    ...mapGetters({
      me: 'me',
      articles: 'articles_all',
      category: 'category',
      verify: 'verify',
      loading: 'loading',
      page: 'page',
      paginate: 'paginate'
    }),
    arr_id(){
      return [...this.me.bookmarks].map(item => item.id)
    }
  },
  methods:{
    ...mapActions({
      me_data: 'me_data',
      articles_data: 'articles_data'
    }),
  },
  mounted() {
    const options = {
      rootMargin: '0px',
      threshold: 1.0,
    }
    const callback = (entries) => {
        if (entries[0].isIntersecting && this.paginate){
          this.articles_data(this.page)
        }
    };
    const observer = new IntersectionObserver(callback, options);
    observer.observe(this.$refs.observer)
  },
  async created(){
    await this.me_data(localStorage.getItem('access'))
    await this.articles_data(1)
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    min-height: 80em;
  }
  ul{
    list-style: none;
  }
  .wrapper-sm{
    padding: 2%;
    min-height: 80em;
  }
  .observer{
    height: 100px;
    width: 100%;
  }
</style>