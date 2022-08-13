<template>
  <ProfileCom class="d-none d-md-block"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="data"
              v-bind:bookmarks="bookmarks"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></ProfileCom>
  <ProfileMob class="d-md-none mob"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="data"
              v-bind:bookmarks="bookmarks"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></ProfileMob>
</template>

<script>
import ProfileCom from "@/components/ProfileCom";
import ProfileMob from "@/components/ProfileMob";
import {mapMutations, mapGetters, mapActions} from 'vuex'
import {nextTick} from "vue";

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
      data: '',
    }
  },
  methods:{
    ...mapActions({
      users_data: 'users_data',
      me_data: 'me_data',
      user_data: 'user_data',
    }),
    tab_func(name){
      for (let i of this.tab_profile){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
    async user_fn(user){
      if (this.me.username === user) {
        this.data = this.me
        this.tab_profile = [
        {active: true, name: 'Subscriptions'},
        {active: false, name: 'Article'},
        {active: false, name: 'Bookmarks'},
        {active: false, name: 'Settings'},]
      }
      else{
        await this.user_data(user)
        this.data = this.user
        this.tab_profile = [
        {active: true, name: 'Subscriptions'},
        {active: false, name: 'Article'},]
      }
    },
  },
  // updated() {
  //   this.users_data()
  //   this.user_fn(this.slug)
  // },
  created() {
    this.users_data()
    this.user_fn(this.slug)
  },
  computed:{
    ...mapGetters({
      users: 'users',
      me: 'me',
      articles_all: 'articles_all',
      user: 'user',
    }),
    articles(){
      return [...this.articles_all,].filter(item => this.data.my_articles.includes(item.id))
    },
    bookmarks(){
      if (this.data === this.me){
        return [...this.articles_all,].filter(item => this.data.bookmarks.includes(item.id))
      }
      else{
        return []
      }
    }
  }
}
</script>

<style scoped>

</style>