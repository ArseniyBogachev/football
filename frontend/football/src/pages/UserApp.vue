<template>
  <MyLoading v-if="true"></MyLoading>
  <div v-else>
    <UserCom class="d-none d-md-block"
                v-bind:tab_profile="tab_profile"
                v-bind:user="user"
                v-bind:crud="crud"
                v-bind:articles="articles"
                v-on:delete_fn="delete_fn"
                v-on:accept_fn="accept_fn"
                v-on:subscript_fn="subscript_fn"
                v-on:tab_func="tab_func"
    ></UserCom>
    <UserMob class="d-md-none mob"
                v-bind:tab_profile="tab_profile"
                v-bind:user="user"
                v-bind:crud="crud"
                v-bind:articles="articles"
                v-on:delete_fn="delete_fn"
                v-on:accept_fn="accept_fn"
                v-on:subscript_fn="subscript_fn"
                v-on:tab_func="tab_func"
    ></UserMob>
  </div>

</template>

<script>
import UserCom from "@/components/UserCom";
import UserMob from "@/components/UserMob";
import MyLoading from "@/components/UI/MyLoading";
import {mapActions, mapGetters} from "vuex";
export default {
  name: "UserApp",
  components:{
    UserCom,
    UserMob,
    MyLoading,
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
      // loading: false,
    }
  },
  methods:{
    ...mapActions({
      user_data: 'user_data',
      user_subscriber: 'user_subscriber',
      user_unsubscribe_reject: 'user_unsubscribe_reject',
      user_accept: 'user_accept',
    }),
    tab_func(name){
      for (let i of this.tab_profile){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
    async delete_fn(id, user){
      await this.user_unsubscribe_reject(id)
      await this.user_data(user)
    },
    async accept_fn(id, user){
      await this.user_accept(id)
      await this.user_data(user)
    },
    async subscript_fn(id, user){
      await this.user_subscriber(id)
      await this.user_data(user)
    },
  },
  created() {
    this.user_data(this.slug)
  },
  computed:{
    ...mapGetters({
      articles_all: 'articles_all',
      user: 'user',
      loading: 'loading',
    }),
    articles(){
      return [...this.articles_all,].filter(item => this.user.my_articles.includes(item.id))
    },
  }
}
</script>

<style scoped>

</style>