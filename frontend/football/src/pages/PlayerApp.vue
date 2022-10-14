<template>
  <PlayerCom class="d-none d-lg-block"
             v-bind:dropdown_menu="dropdown_menu"
             v-bind:tab_team="tab_team"
             v-on:tab_func="tab_func"
             v-bind:player="player"
  ></PlayerCom>
  <PlayerMob class="d-lg-none container"
             v-bind:dropdown_menu="dropdown_menu"
             v-bind:tab_team="tab_team"
             v-on:tab_func="tab_func"
             v-bind:total="total"
             v-bind:position="position"
             v-bind:situation="situation"
             v-bind:shot_zones="shot_zones"
             v-bind:shot_types="shot_types"
  ></PlayerMob>
</template>

<script>
import PlayerCom from "@/components/PlayerCom";
import PlayerMob from "@/components/PlayerMob";
import {mapActions, mapGetters} from 'vuex'
export default {
  name: "PlayerApp",
  components:{
    PlayerMob,
    PlayerCom,
  },
  data(){
    return{
      tab_team:[
        {active: true, name: 'Total'},
        {active: false, name: 'Position'},
        {active: false, name: 'Situation'},
        {active: false, name: 'Shot zones'},
        {active: false, name: 'Shot types'},
      ],
      dropdown_menu:[
        {name: 'Season', item: ['2021-2022', '2022-2023']},
      ],
    }
  },
  props: {
    slug: {
      type: String,
    }
  },
  methods:{
    ...mapActions({
      player_data: 'player_data',
    }),
    tab_func(name){
      for (let i of this.tab_team){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    }
  },
  computed: {
    ...mapGetters({
      player: 'player',
    })
  },
  created() {
    this.player_data(this.slug)
  }
}
</script>

<style scoped>

</style>