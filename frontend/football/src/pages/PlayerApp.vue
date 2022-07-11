<template>
  <PlayerCom class="d-none d-lg-block"
             v-bind:dropdown_menu="dropdown_menu"
             v-bind:tab_team="tab_team"
             v-on:tab_func="tab_func"
             v-bind:total="total"
             v-bind:position="position"
             v-bind:situation="situation"
             v-bind:shot_zones="shot_zones"
             v-bind:shot_types="shot_types"
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
        {Season: '2021-2022', Team: 'Zenit', Apps: 14, Min: 1224, G: 0, A: 0, 'Sh90': 0.66, 'Kp90': 0.07, 'xG': 0.86, 'xA': 0.06, 'xG90': 0.06, 'xA90': 0.00},
        {Season: '2020-2021', Team: 'Zenit', Apps: 21, Min: 1847, G: 2, A: 0, 'Sh90': 1.02, 'Kp90': 0.34, 'xG': 0.97, 'xA': 0.24, 'xG90': 0.05, 'xA90': 0.01},
      ],
      position:[
        {Position: 'CB', Apps: 151, Min: 13233, G: 7, A: 3, 'Sh90': 0.71, 'Kp90': 0.23, 'xG': 7.89, 'xA': 2.84, 'xG90': 0.05, 'xA90': 0.02},
      ],
      situation:[
        {Situation: 'From corner', Sh: 75, G: 4, Kp: 12, A: 1, xG: 5.79, xA: 0.71, xG90: 0.04, xA90: 0.00, 'xG/Sh': 0.08, 'xA/Kp': 0.06},
        {Situation: 'Open play', Sh: 13, G: 0, Kp: 20, A: 1, xG: 0.20, xA: 1.18, xG90: 0.04, xA90: 0.01, 'xG/Sh': 0.02, 'xA/Kp': 0.06},
        {Situation: 'Set piece', Sh: 17, G: 3, Kp: 2, A: 1, xG: 1.85, xA: 0.95, xG90: 0.01, xA90: 0.01, 'xG/Sh': 0.11, 'xA/Kp': 0.47},
        {Situation: 'Direct Freekick', Sh: 4, G: 0, Kp: 0, A: 0, xG: 0.27, xA: 0.00, xG90: 0.01, xA90: 0.00, 'xG/Sh': 0.07, 'xA/Kp': 0.00},
      ],
      shot_zones:[
        {'Shot zones': 'Out of box', Sh: 22, G: 0, Kp: 12, A: 0, xG: 0.54, xA: 0.25, 'xG/Sh': 0.02, 'xA/Kp': 0.02},
        {'Shot zones': 'Penalty area', Sh: 76, G: 6, Kp: 19, A: 1, xG: 6.17, xA: 1.52, 'xG/Sh': 0.08, 'xA/Kp': 0.08},
        {'Shot zones': 'Six-yard box', Sh: 11, G: 1, Kp: 3, A: 2, xG: 1.40, xA: 1.07, 'xG/Sh': 0.13, 'xA/Kp': 0.36},
      ],
      shot_types:[
        {'Shot types': 'Head', Sh: 66, G: 5, Kp: 7, A: 2, xG: 4.56, xA: 1.21, 'xG/Sh': 0.07, 'xA/Kp': 0.17},
        {'Shot types': 'Right foot', Sh: 30, G: 2, Kp: 16, A: 1, xG: 2.21, xA: 1.04, 'xG/Sh': 0.07, 'xA/Kp': 0.07},
        {'Shot types': 'Left foot', Sh: 13, G: 0, Kp: 11, A: 0, xG: 1.35, xA: 0.59, 'xG/Sh': 0.10, 'xA/Kp': 0.05},
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