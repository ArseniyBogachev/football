<template>
  <div class="container-md">
    <MinibarCom v-bind:tab_team="tab_team" v-bind:dropdown_menu="dropdown_menu"></MinibarCom>
    <h3>Matches for Zenit</h3>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Date</th>
          <th scope="col">Home team</th>
          <th scope="col">Score</th>
          <th scope="col">Guest team</th>
        </tr>
      </thead>
      <tbody v-for="match in matches">
        <tr v-if="match.home">
          <th scope="col">{{ match.date }}</th>
          <td>{{ match.club_first }}</td>
          <td v-if="match.goal_first > match.goal_last"><a href="#" class="score" style="background-color: rgba(9, 130, 21, 0.8); color: white;">{{ match.goal_first }} : {{ match.goal_last }}</a></td>
          <td v-else-if="match.goal_first === match.goal_last"><a href="#" class="score" style="background-color: rgba(127, 138, 8, 0.8); color: white;">{{ match.goal_first }} : {{ match.goal_last }}</a></td>
          <td v-else><a href="#" class="score" style="background-color: rgba(138, 8, 8, 0.8); color: white;">{{ match.goal_first }} : {{ match.goal_last }}</a></td>
          <td>{{ match.club_last }}</td>
        </tr>
        <tr v-else>
          <th scope="col">{{ match.date }}</th>
          <td>{{ match.club_last }}</td>
          <td v-if="match.goal_first > match.goal_last"><a href="#" class="score" style="background-color: rgba(9, 130, 21, 0.8); color: white;">{{ match.goal_last }} : {{ match.goal_first }}</a></td>
          <td v-else-if="match.goal_first === match.goal_last"><a href="#" class="score" style="background-color: rgba(127, 138, 8, 0.8); color: white;">{{ match.goal_last }} : {{ match.goal_first }}</a></td>
          <td v-else><a href="#" class="score" style="background-color: rgba(138, 8, 8, 0.8); color: white;">{{ match.goal_last }} : {{ match.goal_first }}</a></td>
          <td>{{ match.club_first }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
export default {
  name: "MatchesCom",
  components:{
    MinibarCom,
  },
  props:{
    tab_team:{
      type:Object,
    },
    matches:{
      type:Object,
    },
    dropdown_menu:{
      type:Array,
    },
  },
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px gray;
    margin-bottom: 100px;
    min-height: 80em;
  }
  .table{
    margin-top: 20px;
    border-collapse: separate;
  }
  h3{
    margin-top: 20px;
    text-align: center;
  }
  .score{
    padding: 1%;
    border: 1px solid #a4a0a2;
    border-radius: 10px;
    text-decoration: none;
    transition: 0.5s;
  }
  .score:hover{
    border-radius: 0;
    transition: 0.5s;
  }
  .score:active{
    box-shadow: 0 0 5px 1px black inset;
    transition: 0.2s;
  }
  td{
    text-align: center;
    width: 33%;
  }
  th{
    text-align: center;
  }
</style>