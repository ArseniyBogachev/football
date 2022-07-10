<template>
  <div class="container-md">
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
            <li><fa icon="fa-solid fa-trophy"></fa><span>8 × RPL</span><span>3 × Russian cup</span><span>6 × Supercup Russian</span><span>1 × Cup UEFA</span><span>1 × Supercup UEFA</span></li>
            <hr>
            <li><fa icon="fa-solid fa-futbol"></fa><span>Сentre-back</span></li>
          </ul>
        </div>
      </div>
    </div>
    <MinibarCom class="minibar" v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu" v-on:tab_func="Do_Something"></MinibarCom>
    <TotalCom v-if="tab_team[0].active" class="d-none d-lg-block"
                 v-bind:total="total"
    ></TotalCom>
    <PositionCom v-else-if="tab_team[1].active" class="d-none d-lg-block"
                 v-bind:position="position"
    ></PositionCom>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
import TotalCom from "@/components/TotalCom";
import PositionCom from "@/components/PositionCom";
export default {
  name: "PlayerCom",
  components:{
    MinibarCom,
    TotalCom,
    PositionCom,
  },
  props:{
    tab_team:{
      type: Object,
    },
    dropdown_menu:{
      type: Array,
    },
    total:{
      type:Array,
    },
    position:{
      type:Array,
    },
  },
  methods:{
    Do_Something(name){
      this.$emit('tab_func', name)
    }
  }
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