<template>
  <div class="base">
    <h4>Article</h4>
    <button v-if="this.crud" type="button" class="btn btn-primary" v-on:click.prevent="$router.push({name: 'create-article', params: {slug: me.username}})">
      <fa icon="fa-solid fa-plus"></fa>
    </button>
    <div class="container">
      <div class="card border-secondary mb-3" style="max-width: 33rem;" v-for="article in articles">
        <div class="card-header bg-transparent border-secondary">
          <small class="text-muted">{{ article.date }}</small>
          <div v-if="this.crud">
            <a href="#" v-on:click.prevent="$router.push({name: 'update-article', params: {user: this.me.username, article: article.title}})"><fa icon="fa-solid fa-pen" style="margin-right: 20px;" class="icon-pen"></fa></a>
            <a href="#" v-on:click.prevent="this.article_delete(article.id)"><fa icon="fa-solid fa-trash-can" class="icon-trash"></fa></a>
          </div>
        </div>
        <div class="card-body text-dark">
          <h5 class="card-title" style="font-size: 15px;">{{ article.title }}</h5>
          <p class="card-text" style="font-size: 13px;">{{ article.text.slice(0,100) }}...</p>
        </div>
        <a href="#" class="card-footer bg-transparent border-secondary" v-on:click.prevent="$router.push({name: 'article', params: {slug: article.title}})"><span>Open</span></a>
      </div>
    </div>
  </div>
</template>

<script>
import {mapActions, mapGetters} from 'vuex'
export default {
  name: "MyarticleMob",
  props:{
    articles:{
      type:Array,
    },
    crud:{
      type: Boolean,
      default: true,
    },
  },
  computed:{
    ...mapGetters({
      me: 'me',
    }),
  },
  methods:{
    ...mapActions({
      article_delete: 'article_delete',
    })
  }
}
</script>

<style scoped>
  .base{
    padding-bottom: 60px;
  }
  .card{
    margin-top: 20px;
  }
  .container{
    margin-left: auto;
    margin-right: auto;
    min-height: 500px;
  }
  h4{
    text-align: center;
    padding-top: 10px;
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
    width: 90%;
    margin: 20px 5% 0 5%;
  }
  .btn:hover{
    box-shadow: 0 0 5px 1px #216bff inset
  }
  .btn:focus{
    box-shadow: none;
  }
</style>