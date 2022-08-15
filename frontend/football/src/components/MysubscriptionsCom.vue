<template>
  <div class="base">
    <h3>Subscriptions</h3>
    <div class="container">
      <div class="card mb-3" style="max-width: 640px;" v-for="s in subscriptions">
        <div class="row g-0">
          <div class="col-md-3">
              <img v-if="s.image" v-bind:src="`http://127.0.0.1:8000/media/${s.image}`" class="img-fluid rounded-start" alt="...">
              <img v-else src="../assets/none.png" class="img-fluid rounded-start" alt="../assets/users/none.png">
          </div>
          <div class="col-md-9">
            <div class="dropend">
                <button class="btn btn-secondary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                  <fa icon="fa-solid fa-ellipsis" class="settings"></fa>
                </button>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="#" @click.prevent="$router.push({name: 'user', params: {slug: s.username}}); next(s)">Profile</a></li>
                  <li><a class="dropdown-item" href="#">Message</a></li>
                  <li><a class="dropdown-item" href="#">Unsubscribe</a></li>
                </ul>
              </div>
            <div class="card-body">
              <span class="card-title">{{ s.first_name }} {{ s.last_name }}</span>
              <hr>
              <ul class="info">
                <li><fa icon="fa-solid fa-user" class="icon"></fa><span class="text">{{ s.username }}</span></li>
<!--                <li><fa icon="fa-solid fa-chart-column" class="icon"></fa><span class="text">{{ s.rate }}</span></li>-->
<!--                <li><fa icon="fa-solid fa-newspaper" class="icon"></fa><span class="text">{{ s.my_articles.length }}</span></li>-->
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapActions} from 'vuex'

export default {
  name: "MysubscriptionsCom",
  props:{
    subscriptions:{
      type:Array,
    },
    crud:{
      type: Boolean,
      default: true,
    },
  },
  methods:{
    ...mapActions({
      user_data: 'user_data',
    }),
    next(s){
      if (!this.crud){
        this.user_data(s.username)
      }
    },
  },
}
</script>

<style scoped>
  h3{
    text-align: center;
    margin-top: 10px;
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
  }
  .container{
    margin-left: auto;
    margin-right: auto;
    overflow-y: auto;
    height: 37em;
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
  .card{
    margin-left: auto;
    margin-right: auto;
    height: 100px;
    position: relative;
  }
  .img-fluid{
    padding: 3%;
    border-radius: 10px;
    height: 100px;
    width: 100px;
  }
  .card-title{
    font-size: 17px;
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
  }
  hr{
    margin: 3% 0;
  }
  .btn{
    background-color: white;
    position: absolute;
    right: 0;
    top: 0;
    border-right: none;
    border-top: none;
    border-left: 1px solid rgb(200,200,200);
    border-bottom: 1px solid rgb(200,200,200);
    border-radius: 0 0 0 5px;
    /*padding: 1%;*/
    color: rgb(100,100,100);
  }
  .btn:hover{
    color: #24456d;
  }
  .btn:active{
    box-shadow: 0 0 5px 1px darkgray;
  }
  .btn:focus{
    color: rgb(100,100,100);
    box-shadow: none;
    background-color: white;
    border-right: none;
    border-top: none;
    border-left: 1px solid rgb(200,200,200);
    border-bottom: 1px solid rgb(200,200,200);
  }
  .info{
    list-style: none;
    display: flex;
    justify-content: space-between;
    padding-left: 0;
  }
  .icon{
    margin-right: 5px;
    color: rgb(100,100,100);
  }
  .text{
    font-size: 14px;
    font-family: "Segoe UI Light";
  }
</style>