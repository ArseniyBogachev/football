<template>
  <TeamsCom class="d-none d-lg-block" v-bind:sort_team="sort_team" v-on:sort_func="sort_func"></TeamsCom>
  <TeamsMob class="d-lg-none" v-bind:sort_team="sort_team" v-on:sort_func="sort_func"></TeamsMob>
</template>

<script>
import TeamsCom from "@/components/TeamsCom";
import TeamsMob from "@/components/TeamsMob";
export default {
  name: "TeamsApp",
  data(){
    return{
      sort_team:{
        xg: false,
        position: false,
        default_: true,
      },
    }
  },
  components:{
    TeamsMob,
    TeamsCom,
  },
  methods:{
    sort_func(tab){
      for (let i in this.sort_team){
        this.sort_team[i] = false
      }
      this.sort_team[tab] = true
    }
  },
}
</script>

<style scoped>

</style>