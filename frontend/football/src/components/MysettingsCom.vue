<template>
  <form class="container" enctype="multipart/form-data">
    <ul class="list">
      <li class="photo mb-3">
        <img v-if="this.image" v-bind:src="this.image" class="img-fluid img-thumbnail">
        <img v-else v-bind:src="user.image" class="img-fluid img-thumbnail">
        <input class="form-control" type="file" ref="formFile" style="margin-top: 162px; margin-left: 20px" @change="previewFiles($event)">
      </li>
      <li class="item">
        <small class="text-muted">Firstname</small>
        <MyInput v-model="field.first_name"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">Lastname</small>
        <MyInput v-model="field.last_name"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">E-mail</small>
        <MyInput v-model="field.email"></MyInput>
      </li>
      <li class="item">
        <small class="text-muted">Username</small>
        <MyInput v-model="field.username"></MyInput>
      </li>
    </ul>
    <button type="button" class="btn btn-success" v-on:click="me_update({image: this.files, first_name: this.field.first_name, last_name: this.field.last_name, email: this.field.email, username: this.field.username})">
      <fa icon="fa-solid fa-floppy-disk"></fa>
    </button>
  </form>
</template>

<script>
import {mapActions} from 'vuex';
import MyInput from "@/components/UI/MyInput";
export default {
  name: "MysettingsCom",
  components:{
    MyInput,
  },
  data(){
    return{
      files: null,
      image: null,
      field: {
        first_name: this.user.first_name,
        last_name: this.user.last_name,
        email: this.user.email,
        username: this.user.username,
      }
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
    width: 90%;
    position: absolute;
    bottom: 0;
  }
  .img-fluid{
    width: 200px;
    height: 200px;
  }
  .container{
    height: 40em;
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
    max-height: 38px;
  }
</style>