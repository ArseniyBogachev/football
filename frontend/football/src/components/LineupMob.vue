<template>
  <div class="container">
    <MinibarMob v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu"></MinibarMob>
    <div class="title-sort">
      <h5>Line-Up Zenit</h5>
      <SeletedMob v-model="modelValue" v-bind:options="options" @change="sorted_func"></SeletedMob>
    </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">Position</th>
          <th scope="col">№</th>
          <th scope="col">First</th>
          <th scope="col">Last</th>
          <th scope="col">Age</th>
          <th scope="col">Games</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="player in players">
            <td><a href="#" class="link-table">{{ player.position }}</a></td>
            <td><a href="#" class="link-table">{{ player.number }}</a></td>
            <td><a href="#" class="link-table">{{ player.firstname }}</a></td>
            <td><a href="#" class="link-table">{{ player.lastname }}</a></td>
            <td><a href="#" class="link-table">{{ player.age }}</a></td>
            <td><a href="#" class="link-table">{{ player.games }}</a></td>
        </tr>
      </tbody>
    </table>
    <ul>
      <li class="small">Gk - Goalkeeper</li>
      <li class="small">Def - Defender</li>
      <li class="small">Mf - Midfielder</li>
      <li class="small">At - Attack</li>
    </ul>
  </div>
</template>

<script>
import MinibarMob from "@/components/UI/MinibarMob";
import SeletedMob from "@/components/UI/SeletedMob";
export default {
  name: "LineupMob",
  components:{
    MinibarMob,
    SeletedMob,
  },
  props:{
    tab_team:{
      type: Object,
    },
    players:{
      type: Object,
    },
    options:{
      type:Object,
    },
    modelValue:{
      type:String,
    },
    dropdown_menu:{
      type: Array,
    },
  },
  methods:{
    sorted_func(event){
      this.$emit('update:modelValue', event.target.value)
    }
  },
}
</script>

<style scoped>
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
  }
  .table{
    margin-top: 20px;
  }
  h5{
    margin-top: 20px;
  }
  td{
    font-size: 10px;
    padding: 0;
    text-align: center;
  }
  th{
    font-size: 10px;
    text-align: center;
    padding: 0;
  }
  .link-table{
    display: block;
    width: 100%;
    height: 40px;
    color: rgb(80,80,80);
    text-decoration: none;
  }
  ul{
    list-style: none;
  }
  .small{
    color: rgba(130,130,130,0.8);
    font-size: 7px;
  }
  .title-sort{
    display: flex;
    justify-content: space-between;
  }
</style>