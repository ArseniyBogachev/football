<template>
  <div class="container">
    <div class="wrapper-total">
      <div class="amound-goals">
        <img v-bind:src="match.home_image" alt="..." class="img-thumbnail image-team">
        <span class="number">{{ match.amount_goals_home_team }}</span>
        <span class="title-club">{{ match.home_team }}</span>
      </div>
      <div class="statistics-total">
        <div class="line-stat" v-for="total in match.total_stats[0]">
          <div class="line-home" v-bind:style="{'width': ((100 / (total.home + total.guest)) * total.home) +'%'}">
            <span class="percent">{{ total.home }}</span>
          </div>
          <div class="line-guest" v-bind:style="{'width': ((100 / (total.home + total.guest)) * total.guest) +'%'}">
            <span class="percent">{{ total.guest }}</span>
          </div>
          <span class="type-stat">{{ total.name.toUpperCase() }}</span>
        </div>
      </div>
      <div class="amound-goals">
        <img v-bind:src="match.guest_image" alt="..." class="img-thumbnail image-team">
        <span class="number">{{ match.amount_goals_guest_team }}</span>
        <span class="title-club">{{ match.guest_team }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
export default {
  name: "MatchesApp",
  computed:{
    ...mapGetters({
      match: 'match',
    })
  },
  methods:{
    ...mapActions({
      match_data: 'match_data',
    })
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
    padding-top: 100px;
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
  .line-stat{
    display: flex;
    position: relative;
    width: 600px;
    margin-top: 5px;
  }
  .line-home{
    background-color: #ff334c;
    height: 40px;
    border-radius: 5px;
    transition-duration: 1s;
    box-shadow: 0 0 3px 1px #b2acab;
  }
  .line-guest{
    background-color: #216bff;
    height: 40px;
    border-radius: 5px;
    text-align: right;
    transition-duration: 1s;
    box-shadow: 0 0 3px 1px #b2acab;
  }
  .line-home:hover{
    transition-duration: 1s;
    background-color: #930c0f;
  }
  .line-guest:hover{
    transition-duration: 1s;
    background-color: #1024b0;
  }
  .type-stat{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 2px;
    border-radius: 5px;
    background-color: #423e40;
    opacity: 0.8;
    color: white;
    font-family: Andale Mono, monospace;
  }
  .percent{
    margin-left: 20px;
    margin-right: 20px;
    color: white;
    font-family: Andale Mono, monospace;
    font-size: 25px;
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
</style>