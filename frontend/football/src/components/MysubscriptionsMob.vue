<template>
  <div class="base">
    <h3>Subscriptions</h3>
    <div class="container">
      <div class="card mb-3" style="width: 100%;" v-for="s in subscriptions">
        <div class="row g-0">
          <div class="col-3">
              <img v-if="s.photo" v-bind:src="require(`../assets/users/${s.photo}`)" class="img-fluid rounded-start" alt="../assets/users/none.png">
              <img v-else src="../assets/users/none.png" class="img-fluid rounded-start" alt="../assets/users/none.png">
          </div>
          <div class="col-9">
            <div class="dropend">
                <button class="btn btn-secondary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                  <fa icon="fa-solid fa-ellipsis" class="settigs"></fa>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="#">Profile</a></li>
                  <li><a class="dropdown-item" href="#">Messege</a></li>
                  <li><a class="dropdown-item" href="#">Unsubscribe</a></li>
                </ul>
            </div>
            <div class="card-body">
              <span class="card-title">{{ s.firstname }} {{ s.lastname }}</span>
              <hr>
              <ul class="info">
                <li><fa icon="fa-solid fa-user" class="icon"></fa><span class="text">{{ s.nickname }}</span></li>
                <li><fa icon="fa-solid fa-chart-column" class="icon"></fa><span class="text">{{ s.rate }}</span></li>
                <li><fa icon="fa-solid fa-newspaper" class="icon"></fa><span class="text">{{ s.article }}</span></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MysubscriptionsMob",
  props:{
    subscriptions:{
      type:Array,
    },
  },
}
</script>

<style scoped>
  .card{
    margin-top: 20px;
    border: 1px solid rgb(150, 150, 150);
  }
  h3{
    text-align: center;
    padding-top: 10px;
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
  }
  .container{
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 40px;
  }
  .card{
    margin-left: auto;
    margin-right: auto;
    height: 100px;
    position: relative;
  }
  .img-fluid{
    border-radius: 5px;
    height: 75px;
    width: 75px;
    border: 1px solid #a4a0a2;
    margin: 7%;
  }
  .card-title{
    font-size: 15px;
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
    color: rgb(100,100,100);

  }
  .btn:hover{
    color: #24456d;
  }
  .btn:focus{
    box-shadow: 0 0 5px 1px darkgray inset;
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
    font-size: 12px;
    font-family: "Segoe UI Light";
  }
  .dropdown-menu{
    background-color: rgb(150, 150, 150);
  }
  .dropdown-item{
    color: rgb(50, 50, 50);
  }
  .dropdown-item:active{
    background-color: #807c7e;
  }
</style>