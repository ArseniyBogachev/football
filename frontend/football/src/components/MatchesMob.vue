<template>
    <h3>Matches for Zenit</h3>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Date</th>
          <th scope="col">Home</th>
          <th scope="col">Score</th>
          <th scope="col">Guest</th>
        </tr>
      </thead>
      <tbody v-for="match in matches">
        <tr>
          <th scope="col">{{ match.date_game }}</th>
          <td>{{ match.home_team }}</td>
          <td><a href="#" class="score" v-bind:style="match.style" @click.prevent="$router.push({name: 'match', params:{club: club, id: match.id}})">{{ match.amount_goals_home_team }} : {{ match.amount_goals_guest_team }}</a></td>
          <td>{{ match.guest_team }}</td>
        </tr>
      </tbody>
    </table>
</template>

<script>
import MinibarMob from "@/components/UI/MinibarMob";
export default {
  name: "MatchesMob",
  components:{
    MinibarMob,
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
    club:{
      type:String,
    },
  },
}
</script>

<style scoped>
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
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
    transition: 0.2s;
  }
  .score:active{
    box-shadow: 0 0 5px 1px black inset;
    transition: 0.1s;
  }
  td{
    text-align: center;
    width: 33%;
    font-size: 12px;
  }
  th{
    text-align: center;
    font-size: 13px;
  }
</style>