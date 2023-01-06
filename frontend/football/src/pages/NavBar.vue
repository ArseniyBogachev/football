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
import axios from "axios";
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
      me_data: 'me_data'
    }),
    async logoutUser(){
      await axios.post('http://127.0.0.1:8000/api/v1/blacklist/', {'token': localStorage.getItem('access')}, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
      localStorage.removeItem('access')
      localStorage.removeItem('refresh')
      localStorage.removeItem('username')
      location.reload()
    }
  },
  computed:{
    ...mapGetters({
      me: 'me',
      verify: 'verify',
      players: 'players_search'
    }),
    search_players(){
      return [...this.players].filter(item => item.last_name.includes(this.search))
    }
  }
}
</script>

<style scoped>

</style>