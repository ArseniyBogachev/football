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
    <a href="#" v-if="n.like_true" v-on:click="$emit('like_fn', n.id)"><fa class="like-dislike-active" icon="fa-solid fa-thumbs-up"></fa></a>
    <a href="#" v-else v-on:click="$emit('like_fn', n.id)"><fa class="like-dislike" icon="fa-solid fa-thumbs-up"></fa></a>
    <span style="margin-left: 5px">{{n.count_true}}</span>
    <a href="#" v-if="n.like_false" v-on:click="$emit('dislike_func')"><fa class="like-dislike-active" icon="fa-solid fa-thumbs-down"></fa></a>
    <a href="#" v-else v-on:click="$emit('dislike_func')"><fa class="like-dislike" icon="fa-solid fa-thumbs-down"></fa></a>
    <span style="margin-left: 5px">{{n.count_false}}</span>
  </div>
  <hr/>
</template>

<script>
export default {
  props:{
    n:{
      type: Array,
    },
    like:{
      type: Boolean,
    },
    dislike:{
      type: Boolean,
    },
    like_count:{
      type: Number,
    },
    dislike_count:{
      type: Number,
    },
  },
  name: "NewsApp"
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
  .like-dislike{
    color: rgb(40,40,40);
    margin-left: 10px;
  }
  .like-dislike-active{
    color: crimson;
    margin-left: 10px;
  }
</style>