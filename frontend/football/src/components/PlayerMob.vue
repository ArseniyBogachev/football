<template>
  <div class="container" style="height: 80em">
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
    <hr>
    <MinibarCom class="minibar" v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="tab_func"></MinibarCom>
    <TableMob v-if="tab_team[0].active"
                 v-bind:table="player.total"
    ></TableMob>
    <TableMob v-else-if="tab_team[1].active"
                 v-bind:table="player.positions"
    ></TableMob>
    <TableMob v-else-if="tab_team[2].active"
                 v-bind:table="player.situations"
    ></TableMob>
    <TableMob v-else-if="tab_team[3].active"
                 v-bind:table="player.shot_zones"
    ></TableMob>
    <TableMob v-else-if="tab_team[4].active"
                 v-bind:table="player.shot_types"
    ></TableMob>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
import TableMob from "@/components/UI/TableMob";
export default {
  name: "PlayerMob",
  components:{
    MinibarCom,
    TableMob,
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
    margin-top: 20px;
    font-size: 10px;
  }
  li{
    font-size: 12px;
  }
  hr{
    margin: 4% 0;
  }
</style>