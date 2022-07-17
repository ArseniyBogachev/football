<template>
  <div class="box">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <img class="image-user" src="../assets/user.jpg" alt="">
<!--        <a class="navbar-brand" href="#"></a>-->
        <ul class="nav justify-content-center" v-for="tab in tab_profile" style="padding-left: 1%; padding-right: 2%">
          <li class="nav-item">
            <a v-if="tab.active" class="nav-link active" aria-current="page" href="#">{{ tab.name }}</a>
            <a v-else class="nav-link" aria-current="page" href="#" @click.prevent="$emit('tab_func', tab.name)">{{ tab.name }}</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="nav-small">
      <div class="name">kuwsh1n</div>
      <div class="rate">
        <div class="following"><fa icon="fa-solid fa-users"></fa><span style="line-height: 15px; margin-left: 4px">28k</span></div>
        <div class="likes" style="margin-left: 20%"><fa icon="fa-solid fa-heart"></fa><span style="line-height: 15px; margin-left: 4px">100k</span></div>
      </div>
    </div>
    <div class="content">
      <div>
        <MysubscriptionsMob v-if="tab_profile[0].active" v-bind:subscriptions="subscriptions"></MysubscriptionsMob>
        <MyarticleMob v-else-if="tab_profile[1].active" v-bind:articles="articles"></MyarticleMob>
        <MybookmarksMob v-else v-bind:bookmarks="bookmarks"></MybookmarksMob>
      </div>
    </div>
  </div>
</template>

<script>
import MybookmarksMob from "@/components/MybookmarksMob";
import MyarticleMob from "@/components/MyarticleMob";
import MysubscriptionsMob from "@/components/MysubscriptionsMob";
export default {
  name: "ProfileMob",
  components:{
    MysubscriptionsMob,
    MybookmarksMob,
    MyarticleMob,
  },
  props:{
    tab_profile:{
      type:Array,
    },
    subscriptions:{
      type:Array,
    },
    articles:{
      type:Array,
    },
    bookmarks:{
      type:Array,
    },
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
    max-width: 50px;
    max-height: 50px;
    position: absolute;
    border-radius: 50%;
    top: -30px;
    left: 20px;
    box-shadow: 0 0 5px 1px black;
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
  }
</style>