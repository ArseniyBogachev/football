<template>
  <div class="box">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <img class="image-user" v-bind:src="user.image" alt="" v-if="user.image">
        <img class="image-user" src="../assets/none.png" alt="" v-else>

        <div class="d-grid" style="margin-bottom: 10px;">
            <button v-if="sub" class="btn btn-danger btn-sm" type="button" v-on:click="$emit('delete_fn', user.id, user.username)">Unsubscribe</button>

            <div v-else-if="user.subscriber_user" class="btn-group">
              <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-bs-toggle="dropdown" aria-expanded="false">
                Request
              </button>
              <ul v-if="user.choice_user" class="dropdown-menu" style="font-size: 12px;">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('accept_fn', user.id, user.username)">Accept</a></li>
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
              <ul v-else class="dropdown-menu">
                <li><a class="dropdown-item" href="#" v-on:click="$emit('delete_fn', user.id, user.username)">Reject</a></li>
              </ul>
            </div>

            <button v-else class="btn btn-primary btn-sm" type="button" v-on:click="$emit('subscript_fn', user.id, user.username)">Subscribe</button>

        </div>

        <ul class="nav justify-content-center" v-for="tab in tab_profile" style="padding-left: 1%; padding-right: 2%">
          <li class="nav-item">
            <a v-if="tab.active" class="nav-link active" aria-current="page" href="#">{{ tab.name }}</a>
            <a v-else class="nav-link" aria-current="page" href="#" @click.prevent="$emit('tab_func', tab.name)">{{ tab.name }}</a>
          </li>
        </ul>

      </div>
    </nav>
    <div class="nav-small">
      <div class="name">{{ user.username }}</div>
      <div class="rate">
        <div class="following"><fa icon="fa-solid fa-users"></fa><span style="line-height: 15px; margin-left: 4px">28k</span></div>
        <div class="likes" style="margin-left: 20%"><fa icon="fa-solid fa-heart"></fa><span style="line-height: 15px; margin-left: 4px">100k</span></div>
      </div>
    </div>
    <div class="content">
      <div>
        <MysubscriptionsMob v-if="tab_profile[0].active"
                            v-bind:subscriptions="user.sub_user"
                            v-bind:crud="crud"
        ></MysubscriptionsMob>
        <MyarticleMob v-else-if="tab_profile[1].active"
                      v-bind:articles="articles"
                      v-bind:crud="crud"
        ></MyarticleMob>
      </div>
    </div>
  </div>
</template>

<script>
import MysubscriptionsMob from "@/components/MysubscriptionsMob";
import MyarticleMob from "@/components/MyarticleMob";
import {mapGetters} from "vuex";
export default {
  name: "UserMob",
  components:{
    MyarticleMob,
    MysubscriptionsMob,
  },
  props:{
    tab_profile:{
      type:Array,
    },
    articles:{
      type:Array,
    },
    user:{
      type:Object,
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
  .box{
    width: 100%;
    margin-top: 102px;
    margin-bottom: -16px;
  }
  .image-user{
    width: 50px;
    height: 50px;
    position: absolute;
    border-radius: 50%;
    top: -25px;
    left: 20px;
    box-shadow: 0 0 5px 1px black;
    border: 2px solid gray;
  }
  .nav-link{
    color: rgb(40, 40, 40);
    font-size: 12px;
    padding: 0;
    line-height: 4em;
  }
  .nav-small{
    width: 100%;
    height: 30px;
    background-color: rgb(150, 150, 150);
    display: flex;
    justify-content: space-between;
    padding: 3px 40px 3px 20px;
  }
  .following{
    font-size: 12px;
    color: rgb(70, 70, 70);
    display: flex;
    justify-content: space-between;
  }
  .likes{
    font-size: 12px;
    color: rgb(70, 70, 70);
    display: flex;
    justify-content: space-between;
  }
  .rate{
    margin-top: 5px;
    display: flex;
    justify-content: space-between;
  }
  .name{
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
    color: rgb(70, 70, 70);
  }
  .content{
    height: 100%;
    background-color: rgb(220,220,220);
  }
  .active{
    text-decoration: underline;
  }
  .nav-item{
    height: 50px;
    margin-top: 10px;
  }
  .btn{
    width: 65px;
    box-shadow: 0 0 5px 1px #474345;
    margin-top: 23px;
    height: 24px;
    font-size: 10px;
    padding: 1%;
  }
</style>