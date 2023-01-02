<template>
  <div class="line-stat" v-for="total in match.total_stats[0]">
    <div class="line-home" v-bind:style="{'width': ((100 / (total.home + total.guest)) * total.home) +'%'}">
      <span class="percent">{{ total.home }}</span>
    </div>
    <div class="line-guest" v-bind:style="{'width': ((100 / (total.home + total.guest)) * total.guest) +'%'}">
      <span class="percent">{{ total.guest }}</span>
    </div>
    <span class="type-stat">{{ total.name.toUpperCase() }}</span>
  </div>
</template>

<script>
export default {
  name: "TotalStatCom",
  props:{
    match: {
      type: Array,
    }
  }
}
</script>

<style scoped>
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
</style>