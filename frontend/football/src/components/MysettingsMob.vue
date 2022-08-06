<template>
  <div class="container">
    <ul class="list" v-for="(u, k) in user">
      <li v-if="k === 'image'" class="photo mb-3">
        <img v-if="this.files" v-bind:src="this.files" class="img-fluid img-thumbnail">
        <img v-else v-bind:src="u" class="img-fluid img-thumbnail">
        <input class="form-control" type="file" ref="formFile" style="margin-left: 20px; margin-top: 70px" @change="previewFiles($event)">
      </li>
      <li class="item" v-else-if="typeof(u) === 'string'">
        <small class="text-muted">{{k.charAt(0).toUpperCase() + k.slice(1)}}</small>
        <input  type="text" class="form-control" v-bind:value="u"></li>
    </ul>
    <button type="button" class="btn btn-success btn-sm"><fa icon="fa-solid fa-floppy-disk"></fa></button>
  </div>
</template>

<script>
export default {
  name: "MysettingsMob",
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