<template>
  <div class="d-none d-lg-block container-md">
    <MinibarCom v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarCom>
    <div>
      <TeamCom v-if="tab_team[0].active"></TeamCom>
      <MatchesCom v-if="tab_team[1].active" v-bind:matches="matches"></MatchesCom>
      <LineupCom v-if="tab_team[2].active" v-model="selected_sort" v-bind:options="options" v-bind:players="sorted"></LineupCom>
    </div>
  </div>
  <div class="d-lg-none container">
    <MinibarMob v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarMob>
    <div>
      <TeamMob v-if="tab_team[0].active"></TeamMob>
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
        {active: true, link: '/teams/club', name: 'Club'},
        {active: false, link: '/teams/club', name: 'Matches'},
        {active: false, link: '/teams/club', name: 'Line-up'},
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
      players:[
        {'position':'Gk', 'number':41, 'firstname':'Mikhail', 'lastname':'Kerzhakov', 'age':35, 'games':19, 'xg':1.5},
        {'position':'Gk', 'number':71, 'firstname':'Daniil', 'lastname':'Odoevskiy', 'age':35, 'games':4, 'xg':1.2},
        {'position':'Gk', 'number':1, 'firstname':'Stanislav', 'lastname':'Krycuk', 'age':35, 'games':1, 'xg':1.6},
        {'position':'Def', 'number':2, 'firstname':'Dmitriy', 'lastname':'Chistyakov', 'age':28, 'games':27, 'xg':1.4},
        {'position':'Def', 'number':44, 'firstname':'Yaroslav', 'lastname':'Rakitckiy', 'age':28, 'games':15, 'xg':1.7},
        {'position':'Def', 'number':4, 'firstname':'Danil', 'lastname':'Krugovoy', 'age':28, 'games':26, 'xg':1.4},
        {'position':'Def', 'number':23, 'firstname':'Arsen', 'lastname':'Adamov', 'age':28, 'games':4, 'xg':1.2},
        {'position':'Def', 'number':28, 'firstname':'Nuraly', 'lastname':'Alip', 'age':28, 'games':10, 'xg':1.1},
        {'position':'Def', 'number':6, 'firstname':'Dejan', 'lastname':'Lovren', 'age':28, 'games':14, 'xg':1.7},
        {'position':'Def', 'number':15, 'firstname':'Vyacheslav', 'lastname':'Karavaev', 'age':28, 'games':17, 'xg':1.6},
        {'position':'Def', 'number':3, 'firstname':'Douglas', 'lastname':'Santos', 'age':28, 'games':27, 'xg':1.9},
        {'position':'Mf', 'number':8, 'firstname':'Wendel', 'lastname':'-', 'age':28, 'games':25, 'xg':1.8},
        {'position':'Mf', 'number':27, 'firstname':'Magomed', 'lastname':'Ozdoev', 'age':28, 'games':13, 'xg':1.5},
        {'position':'Mf', 'number':19, 'firstname':'Alexey', 'lastname':'Sutormin', 'age':28, 'games':25, 'xg':1.5},
        {'position':'Mf', 'number':11, 'firstname':'Claudinho', 'lastname':'-', 'age':28, 'games':23, 'xg':2.0},
        {'position':'Mf', 'number':5, 'firstname':'Vilmar', 'lastname':'Barrios', 'age':28, 'games':27, 'xg':1.9},
        {'position':'Mf', 'number':14, 'firstname':'Daler', 'lastname':'Kuzyaev', 'age':28, 'games':22, 'xg':1.8},
        {'position':'Mf', 'number':17, 'firstname':'Andrey', 'lastname':'Mostovoy', 'age':28, 'games':17, 'xg':1.6},
        {'position':'At', 'number':22, 'firstname':'Artem', 'lastname':'Dzyba', 'age':28, 'games':28, 'xg':1.7},
        {'position':'At', 'number':10, 'firstname':'Malcom', 'lastname':'-', 'age':28, 'games':24, 'xg':1.9},
        {'position':'At', 'number':7, 'firstname':'Serdar', 'lastname':'Azmoun', 'age':28, 'games':15, 'xg':1.8},
        {'position':'At', 'number':33, 'firstname':'Ivan', 'lastname':'Sergeev', 'age':28, 'games':11, 'xg':1.6},
        {'position':'At', 'number':9, 'firstname':'Yuri', 'lastname':'Alberto', 'age':28, 'games':11, 'xg':1.6},
      ]
    }
  },
  methods:{
    tab_func(name){
      for (let i of this.tab_team){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
  },
  computed:{
    sorted(){
      if (this.selected_sort === 'Default'){
        return [...this.players]
      }
      else if (this.selected_sort === 'Lastname'){
        return [...this.players].sort((str1, str2) => (str1.lastname).localeCompare(str2.lastname))
      }
      else if (this.selected_sort === 'Age'){
        return [...this.players].sort((str1, str2) => str2.age - str1.age)
      }
      else if (this.selected_sort === 'Matches'){
        return [...this.players].sort((str1, str2) => str2.games - str1.games)
      }
      else{
        return [...this.players].sort((str1, str2) => str2.xg - str1.xg)
      }
    }
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