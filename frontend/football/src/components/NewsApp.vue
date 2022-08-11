<template>
  <li>
    <h3 class="d-none d-sm-block">{{ n.title }}</h3>
    <a href="#" v-if="this.bookmarks.includes(n.id) && verify" v-on:click.prevent="bookmarks_false(n.id)">
      <fa icon="fa-solid fa-bookmark" class="d-none d-xs-block icon" style="color: #216bff"></fa>
      <fa icon="fa-solid fa-bookmark" class="d-xs-none icon-sm" style="color: #216bff"></fa>
    </a>
    <a href="#" v-else v-on:click.prevent="bookmarks_true(n.id)">
      <fa  icon="fa-solid fa-bookmark" class="d-none d-xs-block icon" style="color: black"></fa>
      <fa  icon="fa-solid fa-bookmark" class="d-xs-none icon-sm" style="color: black"></fa>
    </a>
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
import {mapActions, mapGetters} from 'vuex'
export default {
  name: "NewsApp",
  props:{
    n:{
      type: Object,
    },
    bookmarks:{
      type: Array,
    }
  },
  components:{
    LikesDislikes,
  },
  methods:{
    ...mapActions({
      bookmarks_true: 'bookmarks_true',
      bookmarks_false: 'bookmarks_false'
    }),
  },
  computed:{
    ...mapGetters({
      verify: 'verify'
    }),
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
  .icon-sm{
    position: absolute;
    right: 20px;
    top: 40px;
  }
  .icon:hover{
    opacity: 0.9;
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