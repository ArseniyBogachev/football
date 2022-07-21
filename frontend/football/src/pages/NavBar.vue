<template>
  <NavbarCom class="d-none d-lg-block"
             v-model="search"
             v-bind:players="search_players"
  ></NavbarCom>
  <NavbarMob class="d-lg-none"></NavbarMob>
</template>

<script>
import NavbarCom from "@/components/NavbarCom";
import NavbarMob from "@/components/NavbarMob";
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
  created() {
    this.$store.dispatch('players_data')
  },
  computed:{
    search_players(){
      return [...this.$store.getters.players].filter(item => item.lastname.includes(this.search))
    }
  }
}
</script>

<style scoped>

</style>