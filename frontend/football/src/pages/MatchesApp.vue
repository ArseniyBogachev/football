<template>
  <MatchesCom class="d-none d-lg-block" v-bind:tab_team="tab_team" v-bind:matches="matches"></MatchesCom>
  <MatchesMob class="d-lg-none" v-bind:tab_team="tab_team" v-bind:matches="matches"></MatchesMob>
</template>

<script>
import MatchesCom from "@/components/MatchesCom";
import MatchesMob from "@/components/MatchesMob";
export default {
  name: "MatchesApp",
  data(){
    return{
      tab_team:{
        club: false,
        matches: true,
        line_up: false,
      },
      matches:[
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':0, 'home':true ,'club_last':'Rostov', 'date': '01/09/21'},
        {'club_first':'Zenit', 'goal_first':3, 'goal_last':1, 'home':false ,'club_last':'Cska', 'date': '07/09/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':1, 'home':true ,'club_last':'Orenburg', 'date': '14/09/21'},
        {'club_first':'Zenit', 'goal_first':3, 'goal_last':2, 'home':false ,'club_last':'NN', 'date': '21/09/21'},
        {'club_first':'Zenit', 'goal_first':1, 'goal_last':0, 'home':true ,'club_last':'Lokomotiv', 'date': '28/09/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':2, 'home':false ,'club_last':'Spartak', 'date': '04/10/21'},
        {'club_first':'Zenit', 'goal_first':2, 'goal_last':3, 'home':true ,'club_last':'Terek', 'date': '11/10/21'},
        {'club_first':'Zenit', 'goal_first':4, 'goal_last':0, 'home':false ,'club_last':'Tambov', 'date': '18/10/21'},
      ]
    }
  },
  components:{
    MatchesCom,
    MatchesMob,
  }
}
</script>

<style scoped>

</style>