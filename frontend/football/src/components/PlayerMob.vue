<template>
  <div class="container" style="height: 80em">
    <div class="container">
      <div class="row">
        <div class="col-4"><img src="../assets/teams/zenit/lovren.png" class="img-thumbnail" alt="..."></div>
        <div class="col-8">
          <ul>
            <li><fa icon="fa-solid fa-circle-user"></fa><span>Dejan Lovren</span></li>
            <hr>
            <li><fa icon="fa-solid fa-calendar"></fa><span>11/05/1989</span></li>
            <hr>
            <li><fa icon="fa-solid fa-earth-europe"></fa><span>Chortia</span></li>
            <hr>
            <li><fa icon="fa-solid fa-city"></fa><span>Bratislava</span></li>
            <hr>
            <li><fa icon="fa-solid fa-shirt"></fa><span>Zenit</span></li>
            <hr>
            <li><fa icon="fa-solid fa-futbol"></fa><span>Сentre-back</span></li>
          </ul>
        </div>
      </div>
    </div>
    <hr>
    <MinibarCom class="minibar" v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="Do_Something"></MinibarCom>
    <TableMob v-if="tab_team[0].active"
                 v-bind:table="total"
    ></TableMob>
    <TableMob v-else-if="tab_team[1].active"
                 v-bind:table="position"
    ></TableMob>
    <TableMob v-else-if="tab_team[2].active"
                 v-bind:table="situation"
    ></TableMob>
    <TableMob v-else-if="tab_team[3].active"
                 v-bind:table="shot_zones"
    ></TableMob>
    <TableMob v-else-if="tab_team[4].active"
                 v-bind:table="shot_types"
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
  props: {
    tab_team: {
      type: Object,
    },
    dropdown_menu: {
      type: Array,
    },
    total: {
      type: Array,
    },
    position: {
      type: Array,
    },
    situation: {
      type: Array,
    },
    shot_zones: {
      type: Array,
    },
    shot_types: {
      type: Array,
    },
  },
  methods:{
    Do_Something(name){
      this.$emit('tab_func', name)
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