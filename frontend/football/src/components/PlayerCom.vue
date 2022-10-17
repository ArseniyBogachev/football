<template>
  <div class="container-md">
    <div class="container">
      <div class="row">
        <div class="col-4"><img v-bind:src="player.image" class="img-thumbnail" alt="..."></div>
        <div class="col-8">
          <ul>
            <li><fa icon="fa-solid fa-circle-user"></fa><span>{{ player.first_name }} {{ player.last_name }}</span></li>
            <hr>
            <li><fa icon="fa-solid fa-calendar"></fa><span>{{ player.date }}</span></li>
            <hr>
            <li><fa icon="fa-solid fa-earth-europe"></fa><span>{{ player.country }}</span></li>
            <hr>
            <li><fa icon="fa-solid fa-city"></fa><span>{{ player.city }}</span></li>
            <hr>
            <li><fa icon="fa-solid fa-shirt"></fa><span>{{ player.club }}</span></li>
            <hr>
            <li><fa icon="fa-solid fa-futbol"></fa><span>{{ player.position }}</span></li>
          </ul>
        </div>
      </div>
    </div>
    <MinibarCom class="minibar" v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarCom>
    <TableCom v-if="tab_team[0].active"
                 v-bind:table="player.total"
    ></TableCom>
    <TableCom v-else-if="tab_team[1].active"
                 v-bind:table="player.positions"
    ></TableCom>
    <TableCom v-else-if="tab_team[2].active"
                 v-bind:table="player.situations"
    ></TableCom>
    <TableCom v-else-if="tab_team[3].active"
                 v-bind:table="player.shot_zones"
    ></TableCom>
    <TableCom v-else-if="tab_team[4].active"
                 v-bind:table="player.shot_types"
    ></TableCom>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
import TableCom from "@/components/UI/TableCom";
import {mapActions, mapGetters} from "vuex";
export default {
  name: "PlayerCom",
  components:{
    MinibarCom,
    TableCom,
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
  props:{
    player:{
      type:Object,
    },
  },
  methods:{
    tab_func(name){
      for (let i of this.tab_team){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    }
  },
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px gray;
    height: 80em;
  }
  .container{
    padding-top: 20px;
  }
  ul{
    list-style: none;
  }
  span{
    margin-left: 20px;
  }
  .minibar{
    margin-top: 50px;
  }
</style>