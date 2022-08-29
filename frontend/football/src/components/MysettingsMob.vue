<template>
  <div class="container">
    <ul class="list">
      <li class="photo mb-3">
        <img v-if="this.image" v-bind:src="this.image" class="img-fluid img-thumbnail">
        <img v-else v-bind:src="user.image" class="img-fluid img-thumbnail">
        <input class="form-control" type="file" ref="formFile" style="margin-left: 20px; margin-top: 70px" @change="previewFiles($event)">
      </li>
      <li class="item">
        <small class="text-muted">Firstname</small>
        <MyInput v-model="user.first_name"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">Lastname</small>
        <MyInput v-model="user.last_name"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">E-mail</small>
        <MyInput v-model="user.email"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">Username</small>
        <MyInput v-model="user.username"></MyInput>
      </li>
    </ul>
    <button type="button" class="btn btn-success btn-sm" v-on:click="me_update({image: this.files, first_name: this.user.first_name, last_name: this.user.last_name, email: this.user.email, username: this.user.username})"><fa icon="fa-solid fa-floppy-disk"></fa></button>
  </div>
</template>

<script>
import {mapActions} from "vuex";
import MyInput from "@/components/UI/MyInput";
export default {
  name: "MysettingsMob",
  components:{
    MyInput,
  },
  data(){
    return{
      files: null,
      image: null,
    }
  },
  props:{
    user:{
      type:Object,
    }
  },
  methods:{
    ...mapActions({
      me_update: 'me_update',
    }),
    previewFiles(event){
      this.image = URL.createObjectURL(event.target.files[0])
      this.files = event.target.files[0]
    },
  },
}
</script>

<style scoped>
  .photo{
    display: flex;
    justify-content: space-between;
    margin-bottom: 50px;
    font-family: "Sitka Banner";
    font-size: 21px;
  }
  .btn{
    max-width: 86%;
    position: absolute;
    top: 4%;
    right: 5%;
    max-height: 30px;
  }
  .btn:active{
    box-shadow: 0 0 5px 3px #474345 inset;
  }
  .btn:focus {
    outline: none;
    box-shadow: none;
  }
  .img-fluid{
    width: 100px;
    height: 100px;
  }
  .container{
    height: 32em;
    position: relative;
    padding: 5%;
  }
  .list{
    list-style: none;
    padding: 0;
  }
  .item{
    font-family: "Sitka Banner";
  }
  .form-control{
    max-width: 100%;
    max-height: 30px;
    font-size: 13px;
  }
</style>