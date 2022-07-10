<template>
  <PlayerCom class="d-none d-lg-block"
             v-bind:dropdown_menu="dropdown_menu"
             v-bind:tab_team="tab_team"
             v-on:tab_func="tab_func"
             v-bind:total="total"
             v-bind:position="position"
  ></PlayerCom>
</template>

<script>
import PlayerCom from "@/components/PlayerCom";
export default {
  name: "PlayerApp",
  components:{
    PlayerCom,
  },
  data(){
    return{
      tab_team:[
        {active: true, link: '/teams/lineup/player', name: 'Total'},
        {active: false, link: '/teams/lineup/player', name: 'Position'},
        {active: false, link: '/teams/lineup/player', name: 'Situation'},
        {active: false, link: '/teams/lineup/player', name: 'Shot zones'},
        {active: false, link: '/teams/lineup/player', name: 'Shot types'},
      ],
      dropdown_menu:[
        {name: 'Season', item: ['2021-2022', '2022-2023']},
      ],
      total:[
        {season: '2021-2022', team: 'Zenit', games: 14, min: 1224, goal: 0, assist: 0, 'sh90': 0.66, 'kp90': 0.07, 'xg': 0.86, 'xa': 0.06, 'xg90': 0.06, 'xa90': 0.00},
        {season: '2020-2021', team: 'Zenit', games: 21, min: 1847, goal: 2, assist: 0, 'sh90': 1.02, 'kp90': 0.34, 'xg': 0.97, 'xa': 0.24, 'xg90': 0.05, 'xa90': 0.01},
      ],
      position:[
        {position: 'CB', games: 151, min: 13233, goal: 7, assist: 3, 'sh90': 0.71, 'kp90': 0.23, 'xg': 7.89, 'xa': 2.84, 'xg90': 0.05, 'xa90': 0.02},
      ]
    }
  },
  methods:{
    tab_func(name){
      for (let i of this.tab_team){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    }
  }
}
</script>

<style scoped>

</style>