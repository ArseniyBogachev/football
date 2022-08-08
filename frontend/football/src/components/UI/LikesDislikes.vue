<template>
  <a href="#" v-if="n.like_true" v-on:click.prevent="like_fn(n.id)"><fa class="like-dislike-active" icon="fa-solid fa-thumbs-up"></fa></a>
  <a href="#" v-else v-on:click.prevent="like_fn(n.id)"><fa class="like-dislike" icon="fa-solid fa-thumbs-up"></fa></a>
  <span style="margin-left: 5px">{{n.count_true}}</span>
  <a href="#" v-if="n.like_false" v-on:click.prevent="dislike_fn(n.id)"><fa class="like-dislike-active" icon="fa-solid fa-thumbs-down"></fa></a>
  <a href="#" v-else v-on:click.prevent="dislike_fn(n.id)"><fa class="like-dislike" icon="fa-solid fa-thumbs-down"></fa></a>
  <span style="margin-left: 5px">{{n.count_false}}</span>
</template>

<script>
import {mapActions} from 'vuex'
export default {
  name: "LikesDislikes",
  props:{
    n:{
      type:Object,
    }
  },
  methods:{
    ...mapActions({
      like_fn: 'like_fn',
      dislike_fn: 'dislike_fn'
    }),
  },
}
</script>

<style scoped>
  .like-dislike{
    color: rgb(40,40,40);
    margin-left: 10px;
  }
  .like-dislike-active{
    color: crimson;
    margin-left: 10px;
  }
  span{
    color: darkgrey;
    font-family: Arial, Verdana, Sans-Serif;
    font-size: 12px;
  }
</style>