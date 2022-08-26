<template>
  <div class="container-md">
    <div class="form-outline">
      <MyInput v-model="title"></MyInput>
      <MyTextArea v-model="text"></MyTextArea>
    </div>
    <SelectedCom
        v-model="selected_sort"
        v-bind:options="options"
    ></SelectedCom>
    <button type="button" class="btn btn-dark" @click="$emit('article_fn', {data: {'title': this.title, 'text': this.text, 'cat': this.selected_sort}, id: this.id})">Submit</button>
  </div>
</template>

<script>
import SelectedCom from "@/components/UI/SelectedCom";
import MyTextArea from "@/components/UI/MyTextArea";
import MyInput from "@/components/UI/MyInput";
export default {
  name: "MyForm",
  components:{
    SelectedCom,
    MyTextArea,
    MyInput,
  },
  data() {
    return {
      options: [
        {'name': 'Not chosen', 'value': 'Not chosen'},
        {'name': 'Tactical articles', 'value': 1},
        {'name': 'Articles about player', 'value': 2},
        {'name': 'Articles about XG', 'value': 3},
        {'name': 'Articles about managers', 'value': 4},
        {'name': 'Articles about team', 'value': 5},
      ],
    }
  },
  props:{
    id: {
      type: Number,
      default: null,
    },
    text: {
      type: String,
      default: '',
    },
    title: {
      type: String,
      default: '',
    },
    selected_sort: {
      type: String,
      default: 'Not chosen',
    },
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
  .btn{
    margin-top: 100px;
    margin-bottom: 10px;
  }
</style>