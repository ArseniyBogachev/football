<template>
  <div class="container-md">
    <div class="row">
      <div class="col-4 bg-dark" style="height: 41em">
        <div v-if="user.image">
          <img class="image-user-xxl d-none d-xxl-block" v-bind:src="user.image" alt="">
          <img class="image-user-lg d-none d-lg-block d-xxl-none" v-bind:src="user.image" alt="">
          <img class="image-user-md d-none d-md-block d-lg-none" v-bind:src="user.image" alt="">
        </div>
        <div v-else>
          <img class="image-user-xxl d-none d-xxl-block" src="../assets/none.png" alt="">
          <img class="image-user-lg d-none d-lg-block d-xxl-none" src="../assets/none.png" alt="">
          <img class="image-user-md d-none d-md-block d-lg-none" src="../assets/none.png" alt="">
        </div>
        <p class="followers-md-none d-none d-lg-block">
          <span>58k</span>
          <br>
          <span>Followers</span>
        </p>
        <p class="followers-md d-none d-md-block d-lg-none">
          <span>58k</span>
          <br>
          <span>Followers</span>
        </p>
        <p class="like-md-none d-none d-lg-block">
          <span>204k</span>
          <br>
          <span>Like</span>
        </p>
        <p class="like-md d-none d-md-block d-lg-none">
          <span>204k</span>
          <br>
          <span>Like</span>
        </p>
        <div class="info-user-lg d-none d-lg-block">
          <span class="username">{{user.username}}</span>
          <p class="name-and-age">{{ user.first_name }} {{ user.last_name }} 22 age</p>
          <div class="d-grid gap-2 col-6 mx-auto" style="margin-bottom: 20px;">
            <button v-if="sub" class="btn btn-danger" type="button" v-on:click="$emit('delete_fn', user.id, user.username)">Unsubscribe</button>

            <div v-else-if="user.subscriber_user" class="btn-group">
              <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                Request
              </button>
              <ul v-if="user.choice_user" class="dropdown-menu">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('accept_fn', user.id, user.username)">Accept</a></li>
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
              <ul v-else class="dropdown-menu">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
            </div>

            <button v-else class="btn btn-primary" type="button" v-on:click="$emit('subscript_fn', user.id, user.username)">Subscribe</button>

          </div>
          <div class="line-custom-lg"></div>
        </div>
        <div class="info-user-md d-none d-md-block d-lg-none">
          <span class="username-md">{{user.username}}</span>
          <p class="name-and-age-md">{{ user.firstname }} {{ user.lastname }} 22 age</p>
          <div class="d-grid gap-2 col-6 mx-auto" style="margin-bottom: 20px;">
            <button v-if="sub" class="btn btn-danger" type="button" v-on:click="$emit('delete_fn', user.id, user.username)">Unsubscribe</button>

            <div v-else-if="user.subscriber_user" class="btn-group">
              <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                Request
              </button>
              <ul v-if="user.choice_user" class="dropdown-menu">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('accept_fn', user.id, user.username)">Accept</a></li>
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
              <ul v-else class="dropdown-menu">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
            </div>

            <button v-else class="btn btn-primary" type="button" v-on:click="$emit('subscript_fn', user.id, user.username)">Subscribe</button>

          </div>
          <div class="line-custom-md"></div>
        </div>
        <nav class="nav flex-column menu-md d-none d-md-block" v-for="tab in tab_profile">
          <a v-if="tab.active" class="nav-link bg-dark active" aria-current="page" href="#">{{ tab.name }}</a>
          <a v-else class="nav-link bg-dark" aria-current="page" href="#" @click.prevent="$emit('tab_func', tab.name)">{{ tab.name }}</a>
        </nav>
      </div>
      <div class="col-8">
        <div>
          <MysubscriptionsCom v-if="tab_profile[0].active"
                              v-bind:subscriptions="user.sub_user"
                              v-bind:crud="crud"
          ></MysubscriptionsCom>
          <MyarticleCom v-else-if="tab_profile[1].active"
                        v-bind:articles="articles"
                        v-bind:crud="crud"
          ></MyarticleCom>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import MyarticleCom from "@/components/MyarticleCom";
import MysubscriptionsCom from "@/components/MysubscriptionsCom";
import {mapGetters} from 'vuex';
export default {
  name: "UserCom",
  components:{
    MyarticleCom,
    MysubscriptionsCom,
  },
  props:{
    tab_profile:{
      type: Array,
    },
    user:{
      type: Object,
    },
    articles:{
      type: Array,
    },
    crud:{
      type: Boolean,
    },
  },
  computed:{
    ...mapGetters({
      me: 'me',
    }),
    sub(){
      return Boolean([...this.user.sub_user,].filter(item => item.username === this.me.username).length)
    }
  },
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 -5px 5px 1px grey;
    min-height: 41em;
    margin-top: 102px;
  }
  .bg-dark{
    position: relative;
  }
  .image-user-xxl{
    width: 200px;
    height: 200px;
    position: absolute;
    border-radius: 50%;
    top: -50px;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, 0);
    box-shadow: 0 0 5px 1px black;
    border: 3px solid gray;
  }
  .image-user-lg{
    width: 150px;
    height: 150px;
    position: absolute;
    border-radius: 50%;
    top: -40px;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, 0);
    box-shadow: 0 0 5px 1px black;
    border: 3px solid gray;
  }
  .image-user-md{
    width: 100px;
    height: 100px;
    position: absolute;
    border-radius: 50%;
    top: -30px;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, 0);
    box-shadow: 0 0 5px 1px black;
    border: 3px solid gray;
  }
  .followers-md-none{
    position: absolute;
    color: gray;
    top: 30px;
  }
  .followers-md-none span:first-child{
    font-size: 25px;
    font-family: "Droid Serif";
  }
  .followers-md{
    position: absolute;
    color: gray;
    top: 70px;
  }
  .followers-md span:first-child{
    font-size: 15px;
    font-family: "Droid Serif";
  }
  .followers-md span:last-child{
    font-size: 10px;
    font-family: "Droid Serif";
  }
  .like-md-none{
    position: absolute;
    color: gray;
    right: 10px;
    top: 30px;
  }
  .like-md-none span:first-child{
    font-size: 25px;
    font-family: "Droid Serif";
  }
  .like-md{
    position: absolute;
    color: gray;
    top: 70px;
    right: 10px;
  }
  .like-md span:first-child{
    font-size: 15px;
    font-family: "Droid Serif";
  }
  .like-md span:last-child{
    font-size: 10px;
    font-family: "Droid Serif";
  }
  .info-user-lg{
    margin-top: 40%;
    text-align: center;
  }
  .username{
    color: gray;
  }
  .name-and-age{
    color: gray;
  }
  .line-custom-lg{
    width: 300px;
    border: 1px solid rgb(50, 50, 50);
    margin-left: auto;
    margin-right: auto;
  }
  .info-user-md{
    margin-top: 70%;
    text-align: center;
  }
  .username-md{
    color: gray;
    font-size: 14px;
  }
  .name-and-age-md{
    color: gray;
    font-size: 12px;
  }
  .line-custom-md{
    width: 150px;
    border: 1px solid rgb(50, 50, 50);
    margin-left: auto;
    margin-right: auto;
  }
  .nav-link{
    margin-top: 30px;
    clip-path: polygon(0% 0%, 100% 0%, 90% 100%, 0% 100%);
    transition: 0.2s;
    transform: translate(0, 0);
  }
  .nav-link:hover{
    transform: translate(30px, 0);
    transition: 0.2s;
  }
  .active{
    transform: translate(30px, 0);
  }
  .menu-md{
    text-align: center;
  }
</style>