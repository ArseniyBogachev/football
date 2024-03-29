<template>
  <MyLoading v-if="loading"></MyLoading>
  <div v-else class="d-none d-lg-block container-md">
    <MinibarCom v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarCom>
    <div>
      <TeamCom v-if="tab_team[0].active" v-bind:teams="club"></TeamCom>
      <MatchesCom v-if="tab_team[1].active" v-bind:matches="matches" v-bind:club="club.title"></MatchesCom>
      <LineupCom v-if="tab_team[2].active" v-model="selected_sort" v-bind:options="options" v-bind:players="sorted"></LineupCom>
    </div>
  </div>
  <div class="d-lg-none container">
    <MinibarMob v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarMob>
    <div>
      <TeamMob v-if="tab_team[0].active" v-bind:teams="club"></TeamMob>
      <MatchesMob v-if="tab_team[1].active" v-bind:matches="matches" v-bind:club="club.title"></MatchesMob>
      <LineupMob v-if="tab_team[2].active" v-model="selected_sort" v-bind:options="options" v-bind:players="sorted"></LineupMob>
    </div>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
import MinibarMob from "@/components/UI/MinibarMob";
import TeamCom from "@/components/TeamCom";
import TeamMob from "@/components/TeamMob";
import MatchesCom from "@/components/MatchesCom";
import MatchesMob from "@/components/MatchesMob";
import LineupCom from "@/components/LineupCom";
import LineupMob from "@/components/LineupMob";
import MyLoading from "@/components/UI/MyLoading";
import {mapGetters, mapActions} from 'vuex';
export default {
  name: "ClubApp",
  components:{
    MinibarMob,
    MinibarCom,
    TeamCom,
    TeamMob,
    MatchesCom,
    MatchesMob,
    LineupCom,
    LineupMob,
    MyLoading,
  },
  data(){
    return{
      tab_team:[
        {active: true, name: 'Club'},
        {active: false, name: 'Matches'},
        {active: false, name: 'Line-up'},
      ],
      dropdown_menu:[
        {name: 'Season', item: ['2021-2022', '2022-2023']},
      ],
      selected_sort: 'Default',
      options: [
        {'name':'Default', 'value':'Default'},
        {'name':'Surname', 'value':'Surname'},
        {'name':'Age', 'value':'Age'},
        {'name':'Matches', 'value':'Matches'},
      ],
    }
  },
  props:{
    slug:{
      type: String,
    }
  },
  methods:{
    ...mapActions({
      club_data: 'club_data',
    }),
    tab_func(name){
      for (let i of this.tab_team){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
  },
  computed:{
    ...mapGetters({
      players: 'players',
      teams: 'teams',
      club: 'club',
      loading: 'loading',
      matches: 'matches',
    }),
    sorted(){
      if (this.selected_sort === 'Default'){
        return [...this.players].sort((str1, str2) => str1.position['id'] - str2.position['id'])
      }
      else if (this.selected_sort === 'Surname'){
        return [...this.players].sort((str1, str2) => (str1.last_name).localeCompare(str2.last_name))
      }
      else if (this.selected_sort === 'Age'){
        return [...this.players].sort((str1, str2) => str2.age - str1.age)
      }
      else if (this.selected_sort === 'Matches'){
        return [...this.players].sort((str1, str2) => str2.games - str1.games)
      }
    }
  },
  created() {
    window.scroll({top: 0, left: 0})
    this.club_data(this.slug)
  },
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px gray;
    margin-bottom: 100px;
    min-height: 80em;
  }
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
    min-height: 80em;
  }
</style>