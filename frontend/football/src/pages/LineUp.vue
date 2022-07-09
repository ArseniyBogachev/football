<template>
  <LineupCom class="d-none d-lg-block"
             v-bind:tab_team="tab_team"
             v-bind:players="sorted"
             v-model="selected_sort"
             v-bind:options="options"
  ></LineupCom>
  <LineupMob class="d-lg-none"
             v-bind:tab_team="tab_team"
             v-bind:players="sorted"
             v-model="selected_sort"
             v-bind:options="options"
  ></LineupMob>
</template>

<script>
import LineupCom from "@/components/LineupCom";
import LineupMob from "@/components/LineupMob";
export default {
  name: "LineUp",
  components:{
    LineupCom,
    LineupMob
  },
  data(){
    return{
      tab_team:{
        club: false,
        matches: false,
        line_up: true,
      },
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
  }
}
</script>

<style scoped>

</style>