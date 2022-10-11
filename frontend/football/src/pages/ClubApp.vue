<template>
  <div class="d-none d-lg-block container-md">
    <MinibarCom v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarCom>
    <div>
      <TeamCom v-if="tab_team[0].active" v-bind:teams="club"></TeamCom>
      <MatchesCom v-if="tab_team[1].active" v-bind:matches="matches"></MatchesCom>
      <LineupCom v-if="tab_team[2].active" v-model="selected_sort" v-bind:options="options" v-bind:players="sorted"></LineupCom>
    </div>
  </div>
  <div class="d-lg-none container">
    <MinibarMob v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarMob>
    <div>
      <TeamMob v-if="tab_team[0].active" v-bind:teams="club"></TeamMob>
      <MatchesMob v-if="tab_team[1].active" v-bind:matches="matches"></MatchesMob>
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
      matches:[
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':0, 'home':true ,'club_last':'Rostov', 'date': '01/09/21'},
        {'club_first':'Zenit', 'goal_first':3, 'goal_last':1, 'home':false ,'club_last':'Cska', 'date': '07/09/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':1, 'home':true ,'club_last':'Orenburg', 'date': '14/09/21'},
        {'club_first':'Zenit', 'goal_first':3, 'goal_last':2, 'home':false ,'club_last':'NN', 'date': '21/09/21'},
        {'club_first':'Zenit', 'goal_first':1, 'goal_last':0, 'home':true ,'club_last':'Lokomotiv', 'date': '28/09/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':2, 'home':false ,'club_last':'Spartak', 'date': '04/10/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':3, 'home':true ,'club_last':'Terek', 'date': '11/10/21'},
        {'club_first':'Zenit', 'goal_first':4, 'goal_last':0, 'home':false ,'club_last':'Tambov', 'date': '18/10/21'},
      ],
      selected_sort: 'Default',
      options: [
        {'name':'Default', 'value':'Default'},
        {'name':'Lastname', 'value':'Lastname'},
        {'name':'Age', 'value':'Age'},
        {'name':'Matches', 'value':'Matches'},
        {'name':'XG', 'value':'XG'},
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
      teams_data: 'teams_data',
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
      teams: 'teams',
      club: 'club'
    }),
    sorted(){
      if (this.selected_sort === 'Default'){
        return [...this.$store.getters.players]
      }
      else if (this.selected_sort === 'Lastname'){
        return [...this.$store.getters.players].sort((str1, str2) => (str1.lastname).localeCompare(str2.lastname))
      }
      else if (this.selected_sort === 'Age'){
        return [...this.$store.getters.players].sort((str1, str2) => str2.age - str1.age)
      }
      else if (this.selected_sort === 'Matches'){
        return [...this.$store.getters.players].sort((str1, str2) => str2.games - str1.games)
      }
      else{
        return [...this.$store.getters.players].sort((str1, str2) => str2.xg - str1.xg)
      }
    }
  },
  created() {
    this.$store.dispatch('players_data')
    this.club_data(this.slug)
    window.scroll(0, 0)
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