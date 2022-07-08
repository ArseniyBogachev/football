<template>
  <ClubCom class="d-none d-lg-block" v-bind:tab_team="tab_team"></ClubCom>
  <ClubMob class="d-lg-none" v-bind:tab_team="tab_team"></ClubMob>
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
}
</script>

<style scoped>

</style>