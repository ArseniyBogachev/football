<template>
  <div class="container-md">
    <div class="form-outline">
      <input type="text" class="form-control title" id="textAreaExample3" placeholder="Title" v-model="this.title">
      <textarea type="text" class="form-control article" id="textAreaExample1" placeholder="Articles" v-model="this.article" rows="4"></textarea>
    </div>
    <SelectedCom
        v-model="selected_sort"
        v-bind:options="options"
    ></SelectedCom>
    <button type="button" class="btn btn-dark" @click="article_create({'title': this.title, 'text': this.article, 'cat': this.selected_sort})">Submit</button>
  </div>
</template>

<script>
import SelectedCom from "@/components/UI/SelectedCom";
import {mapActions} from 'vuex';
export default {
  name: "CreatearticlesApp",
  data(){
    return{
      article: '',
      title: '',
      selected_sort: 'Not chosen',
      options:[
        {'name':'Not chosen', 'value':'Not chosen'},
        {'name':'Tactical articles', 'value': 1},
        {'name':'Articles about player', 'value': 2},
        {'name':'Articles about XG', 'value': 3},
        {'name':'Articles about managers', 'value': 4},
        {'name':'Articles about team', 'value': 5},
      ],
    }
  },
  props: {
    slug: String,
  },
  components:{
    SelectedCom,
  },
  methods:{
    ...mapActions({
      article_create: 'article_create',
    }),
  },
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
    min-height: 658px;
  }
  .form-outline{
    padding-top: 30px;
  }
  .title{
    margin-top: 20px;
  }
  .article{
    margin-top: 20px;
    min-height: 300px;
  }
  .btn{
    margin-top: 100px;
    margin-bottom: 10px;
  }
</style>