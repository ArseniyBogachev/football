<template>
  <ProfileCom class="d-none d-md-block"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="user"
              v-bind:bookmarks="bookmarks"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></ProfileCom>
  <ProfileMob class="d-md-none mob"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="user"
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
    }
  },
  methods:{
    ...mapActions({
      users_data: 'users_data',
      // me_data: 'me_data',
    }),
    tab_func(name){
      for (let i of this.tab_profile){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    }
  },
  created() {
    this.users_data()
  },
  computed:{
    ...mapGetters({
      users: 'users',
      user: 'me',
      articles_all: 'articles_all'
    }),
    articles(){
      return [...this.articles_all,].filter(item => this.user.my_articles.includes(item.id))
    },
    bookmarks(){
      return [...this.articles_all,].filter(item => this.user.bookmarks.includes(item.id))
    }
  }
}
</script>

<style scoped>

</style>