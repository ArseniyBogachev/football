<template>
  <div class="container-md">
    <h1 class="title">Category Article</h1>
    <hr>
    <div class="wrapper" v-for="i in category.length / 3">
      <div class="card" style="width: 18rem;" v-for="cat in category.slice(3*(i-1), 3*i)">
        <img v-if="cat.image" v-bind:src="cat.image" class="card-img-top" alt="...">
        <img v-else v-bind:src="require('../assets/all.jpg')" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">{{ cat.title }}</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" @click.prevent="$router.push({name: 'article_cat', params:{slug: cat.link}})" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ArticleApp",
  props:{
    category:{
      type: Array,
    },
  },
}
</script>

<style scoped>
  .wrapper{
    padding: 5%;
  }
  .title{
    text-align: center;
    padding-top: 50px;
    font-family: "system-ui";
  }
  .btn-primary{
    background-color: gray;
    border: 1px solid rgb(100,100,100);
  }
  .card{
    margin-top: 100px;
    margin-left: auto;
    margin-right: auto;
    height: 10%;
  }
</style>