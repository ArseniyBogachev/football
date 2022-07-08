<template>
  <div class="container-md">
    <MinibarCom v-bind:tab_team="tab_team"></MinibarCom>
    <h3>Line-Up Zenit</h3>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">Position</th>
          <th scope="col">Number</th>
          <th scope="col">First</th>
          <th scope="col">Last</th>
          <th scope="col">Age</th>
          <th scope="col">Matches</th>
          <th scope="col">XG</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="player in players">
            <th scope="row"><a href="" class="link-table">{{ player.position }}</a></th>
            <td><a href="" class="link-table">{{ player.number }}</a></td>
            <td><a href="" class="link-table">{{ player.firstname }}</a></td>
            <td><a href="" class="link-table">{{ player.lastname }}</a></td>
            <td><a href="" class="link-table">{{ player.age }}</a></td>
            <td><a href="" class="link-table">{{ player.games }}</a></td>
            <td><a href="" class="link-table">{{ player.xg }}</a></td>
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
import MinibarCom from "@/components/MinibarCom";
export default {
  name: "LineupCom",
  components:{
    MinibarCom,
  },
  props:{
    tab_team:{
      type: Object,
    },
    players:{
      type: Object,
    },
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px gray;
    margin-bottom: 100px;
  }
  .table{
    margin-top: 20px;
  }
  h3{
    margin-top: 20px;
    text-align: center;
  }
  .link-table{
    display: block;
    width: 100%;
    height: 40px;
    color: rgb(100,100,100);
    text-decoration: none;
  }
  td {
    padding: 0;
    text-align: center;
  }
  th {
    text-align: center;
    padding: 0;
  }
  tbody tr:hover{
    box-shadow: 0 0 15px 1px rgb(130,130,130) inset;
  }
  ul{
    list-style: none;
  }
  .small{
    color: rgba(130,130,130,0.8);
  }
</style>
<!--v-on:click="$emit('tab_func', Object.keys(tab_team)[0])"-->