<template>
  <li>
    <h3 class="d-none d-sm-block">{{ n.title }}</h3>
    <MyBookmarks class="d-none d-xs-block icon"
                 v-bind:article="n"
                 v-bind:arr_id="arr_id"
    ></MyBookmarks>
    <MyBookmarks class="d-xs-none icon-sm"
                 v-bind:article="n"
                 v-bind:arr_id="arr_id"
    ></MyBookmarks>
    <h5 class="d-sm-none">{{ n.title }}</h5>
    <span><a href="#" class="author" v-on:click.prevent="$router.push({name: 'user', params: {slug: n.author}})">{{n.author}}</a> | {{n.date}}</span>
    <p class="d-none d-sm-block">{{ n.text.slice(0,500) }}<button type="button" class="btn btn-link" v-on:click.prevent="$router.push({name: 'article', params: {slug: n.title}})">read...</button></p>
    <p class="d-sm-none sm-text">{{ n.text.slice(0,250) }}...</p>
    <button type="button" class="d-sm-none btn btn-secondary btn-sm" v-on:click.prevent="$router.push({name: 'article', params: {slug: n.title}})">read</button>
  </li>
  <div>
    <LikesDislikes v-bind:n="n"></LikesDislikes>
  </div>
  <hr/>
</template>

<script>
import LikesDislikes from "@/components/UI/LikesDislikes";
import MyBookmarks from "@/components/UI/MyBookmarks";
export default {
  name: "NewsApp",
  props:{
    n:{
      type: Object,
    },
    arr_id: Array,
  },
  components:{
    LikesDislikes,
    MyBookmarks,
  },
}
</script>

<style scoped>
  .author{
    text-decoration: none;
    color: darkgrey;
  }
  .author:hover{
    color: #676365;
    text-decoration: underline;
  }
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
    opacity: 0.8;
  }
  .icon-sm:hover{
    opacity: 0.8;
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