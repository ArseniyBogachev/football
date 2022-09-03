<template>
  <ProfileCom class="d-none d-md-block"
              v-bind:tab_profile="tab_profile"
              v-bind:user="me"
              v-bind:crud="crud"
              v-bind:bookmarks="bookmarks"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></ProfileCom>
  <ProfileMob class="d-md-none mob"
              v-bind:tab_profile="tab_profile"
              v-bind:user="me"
              v-bind:crud="crud"
              v-bind:bookmarks="bookmarks"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></ProfileMob>
</template>

<script>
import ProfileCom from "@/components/ProfileCom";
import ProfileMob from "@/components/ProfileMob";
import {mapMutations, mapGetters, mapActions} from 'vuex'
export default {
  name: "ProfileApp",
  props: {
    slug:{
      type: String,
    },
  },
  components:{
    ProfileCom,
    ProfileMob,
  },
  data(){
    return{
      tab_profile:[
        {active: true, name: 'Subscriptions'},
        {active: false, name: 'Article'},
        {active: false, name: 'Bookmarks'},
        {active: false, name: 'Settings'},
      ],
      crud: true,
    }
  },
  methods: {
    tab_func(name) {
      for (let i of this.tab_profile) {
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
  },
  computed:{
    ...mapGetters({
      me: 'me',
      articles_all: 'articles_all',
    }),
    articles(){
      return [...this.articles_all,].filter(item => this.me.my_articles.includes(item.id))
    },
    bookmarks(){
      return [...this.articles_all,].filter(item => this.me.bookmarks.includes(item.id))
    }
  }
}
</script>

<style scoped>
</style>