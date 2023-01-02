<template>
  <div class="container">
    <label class="date"><fa icon="fa-solid fa-calendar-days" class="icon"/><span class="date-text">{{match.date_game}}</span></label>
    <hr>
    <div class="wrapper-total">
      <div class="amound-goals">
        <img v-bind:src="match.home_image" alt="..." class="img-thumbnail image-team">
        <span class="number">{{ match.amount_goals_home_team }}</span>
        <span class="title-club">{{ match.home_team }}</span>
      </div>
      <div class="statistics-total">
        <MinibarCom v-bind:tab_team="tab_team_total" v-on:tab_func="tab_func_total"></MinibarCom>
        <TotalStatCom v-if="tab_team_total[0].active" v-bind:match="match"></TotalStatCom>
        <TeamLineupsCom v-if="tab_team_total[1].active" v-bind:match="match"></TeamLineupsCom>
      </div>
      <div class="amound-goals">
        <img v-bind:src="match.guest_image" alt="..." class="img-thumbnail image-team">
        <span class="number">{{ match.amount_goals_guest_team }}</span>
        <span class="title-club">{{ match.guest_team }}</span>
      </div>
    </div>
    <MinibarCom v-bind:tab_team="tab_team_lineup" v-on:tab_func="tab_func_lineup"></MinibarCom>
    <TableCom v-if="tab_team_lineup[0].active" v-bind:table="match.players_stats.home" class="table-lineup"></TableCom>
    <TableCom v-if="tab_team_lineup[1].active" v-bind:table="match.players_stats.guest" class="table-lineup"></TableCom>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex';
import MinibarCom from "@/components/UI/MinibarCom";
import TotalStatCom from "@/components/TotalStatCom";
import TeamLineupsCom from "@/components/TeamLineupsCom";
import TableCom from "@/components/UI/TableCom";
export default {
  name: "MatchesApp",
  data(){
    return{
      tab_team_total:[
        {active: true, name: 'TOTAL'},
        {active: false, name: 'TEAM LINEUPS'},
      ],
      tab_team_lineup:[
        {active: true, name: 'HOME'},
        {active: false, name: 'GUEST'},
      ],
    }
  },
  components:{
    MinibarCom,
    TotalStatCom,
    TeamLineupsCom,
    TableCom,
  },
  computed:{
    ...mapGetters({
      match: 'match',
    })
  },
  methods:{
    ...mapActions({
      match_data: 'match_data',
    }),
    tab_func_total(name){
      for (let i of this.tab_team_total){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
    tab_func_lineup(name){
      for (let i of this.tab_team_lineup){
        let a = (i.name === name) ? i.active = true : i.active = false
      }
    },
  },
  props:{
    id:{
      type: Number,
    }
  },
  created() {
    this.match_data(this.id)
  }
}
</script>

<style scoped>
  .container{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
    min-height: 80em;
  }
  .wrapper-total{
    display: flex;
    justify-content: space-around;
    padding-top: 30px;
  }
  .amound-goals{
    width: 200px;
    height: 200px;
    border-radius: 50%;
    border: 1px solid #757173;
    position: relative;
  }
  .number{
    font-size: 100px;
    font-family: Arial, sans-serif, -apple-system, system-ui, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%)
  }
  .image-team{
    border-radius: 50%;
    opacity: 0.3;
    box-shadow: 0 0 5px 1px black inset;
  }
  .table-lineup{
    margin-top: 20px;

  }
  .title-club{
    position: absolute;
    bottom: -50px;
    left: 50%;
    transform: translate(-50%, 0);
    font-size: 30px;
    font-family: Impact, fantasy;
    color: #403a39;
  }
  .date{
    display: block;
    padding-top: 50px;
  }
  .icon{
    color: #403a39;
  }
  .date-text{
    font-family: Andale Mono, monospace;
    margin-left: 5px;
    color: #403a39;
  }
</style>