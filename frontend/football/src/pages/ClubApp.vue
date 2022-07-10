<template>
  <ClubCom class="d-none d-lg-block"
           v-bind:tab_team="tab_team"
           v-bind:dropdown_menu="dropdown_menu"
  ></ClubCom>
  <ClubMob class="d-lg-none"
           v-bind:tab_team="tab_team"
           v-bind:dropdown_menu="dropdown_menu"
  ></ClubMob>
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
      tab_team:[
        {active: true, link: '/teams/club', name: 'Club'},
        {active: false, link: '/teams/matches', name: 'Matches'},
        {active: false, link: '/teams/lineup', name: 'Line-up'},
      ],
      dropdown_menu:[
        {name: 'Season', item: ['2021-2022', '2022-2023']},
      ],
    }
  },
}
</script>

<style scoped>

</style>