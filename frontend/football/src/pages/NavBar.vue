<template>
  <NavbarCom class="d-none d-lg-block"
             v-model="search"
             v-bind:players="search_players"
             v-bind:user="me"
  ></NavbarCom>
  <NavbarMob class="d-lg-none"
             v-model="search"
             v-bind:players="search_players"
             v-bind:user="me"
  ></NavbarMob>
</template>

<script>
import NavbarCom from "@/components/NavbarCom";
import NavbarMob from "@/components/NavbarMob";
import {mapGetters} from 'vuex';
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
  },
  created() {
    this.$store.dispatch('players_data')
    this.$store.dispatch('me_data')
  },
  computed:{
    ...mapGetters({
      me: 'me'
    }),
    search_players(){
      return [...this.$store.getters.players].filter(item => item.lastname.includes(this.search))
    }
  }
}
</script>

<style scoped>

</style>