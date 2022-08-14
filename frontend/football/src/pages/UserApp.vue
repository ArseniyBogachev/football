<template>
  <UserCom class="d-none d-md-block"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="user"
              v-bind:crud="crud"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></UserCom>
  <UserMob class="d-md-none mob"
              v-bind:tab_profile="tab_profile"
              v-bind:subscriptions="users"
              v-bind:user="user"
              v-bind:crud="crud"
              v-bind:articles="articles"
              v-on:tab_func="tab_func"
  ></UserMob>
</template>

<script>
import UserCom from "@/components/UserCom";
import UserMob from "@/components/UserMob";
import {mapActions, mapGetters} from "vuex";
export default {
  name: "UserApp",
  components:{
    UserCom,
    UserMob
  },
  props: {
    slug:{
      type: String,
    },
  },
  data(){
    return{
      tab_profile:[
        {active: true, name: 'Subscriptions'},
        {active: false, name: 'Article'},
      ],
      crud: false,
    }
  },
  methods:{
    ...mapActions({
      user_data: 'user_data',
    }),
    tab_func(name){
      for (let i of this.tab_profile){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
  },
  created() {
    this.user_data(this.slug)
  },
  computed:{
    ...mapGetters({
      users: 'users',
      articles_all: 'articles_all',
      user: 'user',
    }),
    articles(){
      return [...this.articles_all,].filter(item => this.user.my_articles.includes(item.id))
    },
  }
}
</script>

<style scoped>

</style>