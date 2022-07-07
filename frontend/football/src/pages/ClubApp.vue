<template>
  <ClubCom class="d-none d-lg-block" v-bind:tab_team="tab_team" v-on:tab_func="tab_func"></ClubCom>
  <ClubMob class="d-lg-none" v-bind:tab_team="tab_team" v-on:tab_func="tab_func"></ClubMob>
</template>

<script>
import ClubCom from "@/components/ClubCom";
import ClubMob from "@/components/ClubMob";
export default {
  components:{
    ClubMob,
    ClubCom,
  },
  name: "ClubApp",
  data(){
    return{
      tab_team:{
        club: true,
        matches: false,
        line_up: false,
      },
    }
  },
  methods:{
    tab_func(tab){
      for (let i in this.tab_team){
        this.tab_team[i] = false
      }
      this.tab_team[tab] = true
    }
  },
}
</script>

<style scoped>

</style>