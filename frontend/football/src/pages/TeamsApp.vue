<template>
    <TeamsCom class="d-none d-lg-block"
              v-bind:teams="sorted"
              v-model="selected_sort"
              v-bind:options="options"
    ></TeamsCom>
  <TeamsMob class="d-lg-none"
              v-bind:teams="sorted"
              v-model="selected_sort"
              v-bind:options="options"
  ></TeamsMob>
</template>

<script>
import TeamsCom from "@/components/TeamsCom";
import TeamsMob from "@/components/TeamsMob";
export default {
  name: "TeamsApp",
  data(){
    return{
      selected_sort: 'Default',
      options:[
        {'name':'Default', 'value':'Default'},
        {'name':'Position', 'value':'Position'},
        {'name':'XG', 'value':'XG'},
      ],
      teams:[
        {'title':'Zenit', 'photo': 'zenit.svg', 'position': 1, 'xg': 1.2},
        {'title':'Cska', 'photo': 'cska.svg', 'position': 5, 'xg': 1.0},
        {'title':'Rostov', 'photo': 'rostov.svg', 'position': 3, 'xg': 1.1},
        {'title':'Spartak', 'photo': 'spartak.svg', 'position': 8, 'xg': 1.0},
        {'title':'Ural', 'photo': 'ural.svg', 'position': 4, 'xg': 0.8},
      ]
    }
  },
  components:{
    TeamsMob,
    TeamsCom,
  },
  computed:{
    sorted(){
      if (this.selected_sort === 'Default'){
        return [...this.teams]
      }
      else if (this.selected_sort === 'Position'){
        return [...this.teams].sort((str1, str2) => str1.position - str2.position)
      }
      else{
        return [...this.teams].sort((str1, str2) => str2.xg - str1.xg)
      }
    }
  }
}
</script>

<style scoped>
  .list-enter-active,
  .list-leave-active {
    transition: all 0.5s ease;
  }
  .list-enter-from,
  .list-leave-to {
    opacity: 0;
    transform: translateX(30px);
  }
</style>