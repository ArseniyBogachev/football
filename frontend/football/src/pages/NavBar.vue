<template>
  <NavbarCom class="d-none d-lg-block"
             v-model="search"
             v-bind:players="search_players"
             v-bind:user="me"
             v-bind:verify="verify"
             v-on:logoutUser="logoutUser"
  ></NavbarCom>
  <NavbarMob class="d-lg-none"
             v-model="search"
             v-bind:players="search_players"
             v-bind:user="me"
             v-bind:verify="verify"
             v-on:logoutUser="logoutUser"
  ></NavbarMob>
</template>

<script>
import NavbarCom from "@/components/NavbarCom";
import NavbarMob from "@/components/NavbarMob";
import {mapGetters, mapActions} from 'vuex';
export default {
  name: "NavBar",
  data(){
    return{
      search: '',
    }
  },
  components:{
    NavbarMob,
    NavbarCom,
  },
  methods:{
    ...mapActions({
      players_data: 'players_data',
      me_data: 'me_data'
    }),
    logoutUser(){
      localStorage.removeItem('access')
      localStorage.removeItem('refresh')
      localStorage.removeItem('username')
      location.reload()
    }
  },
  created() {
    this.players_data()
  },
  computed:{
    ...mapGetters({
      me: 'me',
      verify: 'verify',
      players: 'players'
    }),
    search_players(){
      return [...this.players].filter(item => item.lastname.includes(this.search))
    }
  }
}
</script>

<style scoped>

</style>