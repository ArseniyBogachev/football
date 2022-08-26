<template>
  <input type="text" class="form-control title" id="textAreaExample3" placeholder="Title" v-bind:value="modelValue" @input="title_func">
</template>

<script>
export default {
  name: "MyInput",
  props:{
    modelValue:{
      type: String,
    }
  },
  methods:{
    title_func(event){
      this.$emit('update:modelValue', event.target.value)
    },
  },
}
</script>

<style scoped>
  .title{
    margin-top: 20px;
  }
</style>