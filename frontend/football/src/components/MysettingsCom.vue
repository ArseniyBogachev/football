<template>
  <div class="container">
    <ul class="list" v-for="(u, k) in user">
      <li v-if="k === 'photo'" class="photo mb-3">
        <img v-if="this.files" v-bind:src="this.files" class="img-fluid img-thumbnail">
        <img v-else v-bind:src="require(`../assets/users/${u}`)" class="img-fluid img-thumbnail">
        <input class="form-control" type="file" ref="formFile" style="margin-top: 162px; margin-left: 20px" @change="previewFiles($event)">
      </li>
      <li class="item" v-else>
        <small class="text-muted">{{k.charAt(0).toUpperCase() + k.slice(1)}}</small>
        <input  type="text" class="form-control" v-bind:value="u"></li>
    </ul>
    <button type="button" class="btn btn-success"><fa icon="fa-solid fa-floppy-disk"></fa></button>
  </div>
</template>

<script>
export default {
  name: "MysettingsCom",
  data(){
    return{
      files: null,
    }
  },
  props:{
    user:{
      type:Object,
    }
  },
  methods:{
    previewFiles(event){
      this.files = URL.createObjectURL(event.target.files[0])
    }
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