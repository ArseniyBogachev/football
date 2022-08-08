<template>
  <li>
    <h3 class="d-none d-sm-block">{{ n.title }}</h3>
    <fa icon="fa-solid fa-bookmark" class="icon"></fa>
    <h5 class="d-sm-none">{{ n.title }}</h5>
    <span>{{n.author}}|{{n.date}}</span>
    <p class="d-none d-sm-block">{{ n.text.slice(0,500) }}<button type="button" class="btn btn-link">read...</button></p>
    <p class="d-sm-none sm-text">{{ n.text.slice(0,250) }}...</p>
    <button type="button" class="d-sm-none btn btn-secondary btn-sm">read</button>
  </li>
  <div>
    <LikesDislikes v-bind:n="n"></LikesDislikes>
  </div>
  <hr/>
</template>

<script>
import LikesDislikes from "@/components/UI/LikesDislikes";
export default {
  name: "NewsApp",
  props:{
    n:{
      type: Object,
    },
  },
  components:{
    LikesDislikes,
  }
}
</script>

<style scoped>
  li{
    position: relative;
  }
  .icon{
    position: absolute;
    right: 30px;
    top: 70px;
  }
  h3{
    text-align: center;
    padding-top: 5%;
  }
  h5{
    text-align: center;
    padding-top: 13%;
  }
  span{
    color: darkgrey;
    font-family: Arial, Verdana, Sans-Serif;
    font-size: 12px;
  }
  p{
    font-size: 17px;
    font-family: "Arial Narrow";
  }
  .btn-link{
    margin-bottom: 5px;
  }
  .btn-sm{
    float: right;
    margin-right: 20px;
  }
  .sm-text{
    font-size: 14px;
  }
</style>