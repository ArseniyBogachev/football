<template>
  <div class="base">
    <h3>Article</h3>
    <div class="container">
      <div class="card border-secondary mb-3" style="max-width: 50rem;" v-for="article in articles">
        <div class="card-header bg-transparent border-secondary">
          <small class="text-muted">{{ article.date }}</small>
          <div v-if="this.crud">
            <a href="#"><fa icon="fa-solid fa-pen" style="margin-right: 20px;" class="icon-pen"></fa></a>
            <a href="#"><fa icon="fa-solid fa-trash-can" class="icon-trash"></fa></a>
          </div>
        </div>
        <div class="card-body text-dark">
          <h5 class="card-title">{{ article.title }}</h5>
          <p class="card-text">{{ article.text.slice(0,200) }}...</p>
        </div>
        <a href="#" class="card-footer bg-transparent border-secondary" v-on:click.prevent="$router.push({name: 'article', params: {slug: article.title}})"><span>Open</span></a>
      </div>
    </div>
    <button v-if="this.crud" type="button" class="btn btn-primary" v-on:click.prevent="$router.push({name: 'create-article', params: {slug: me.username}})">
      <fa icon="fa-solid fa-plus"></fa>
    </button>
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
export default {
  name: "MyarticleCom",
  props:{
    articles:{
      type:Array,
    },
    crud:{
      type: Boolean,
      default: true,
    }
  },
  computed:{
    ...mapGetters({
      me: 'me',
    }),
  }
}
</script>

<style scoped>
  .card{
    margin-top: 20px;
  }
  .container{
    margin-left: auto;
    margin-right: auto;
    overflow-y: auto;
    height: 33em;
  }
  .container::-webkit-scrollbar {
    width: 7px;
    border-radius: 5px;
    border: 1px solid rgb(100,100,100);
  }
  .container::-webkit-scrollbar-thumb {
    border-radius: 5px;
    background-color: #474345;
  }
  h3{
    text-align: center;
    margin-top: 10px;
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
  }
  .card-footer{
    text-align: center;
    text-decoration: none;
    color: #1e1a1c;
  }
  .card-footer:hover{
    box-shadow: 0 0 5px 1px darkgray inset;
  }
  .card-footer:active{
    box-shadow: 0 0 10px 5px darkgray inset;
  }
  .card-header{
    display: flex;
    justify-content: space-between;
  }
  .icon-trash{
    color: #2a2628;
  }
  .icon-pen{
    color: #2a2628;
  }
  .icon-trash:hover{
    color: #ad1112;
  }
  .icon-pen:hover{
    color: #216bff;
  }
  .btn{
    width: 100%;
    margin-top: 20px;
  }
  .btn:hover{
    box-shadow: 0 0 5px 1px #216bff inset
  }
  .btn:focus{
    box-shadow: none;
  }
</style>