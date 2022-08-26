<template>
  <textarea type="text" class="form-control article" id="textAreaExample1" placeholder="Articles" v-bind:value="modelValue" rows="4" @input="text_func"></textarea>
</template>

<script>
export default {
  name: "MyTextArea",
  props:{
    modelValue:{
      type: String,
    }
  },
  methods:{
    text_func(event){
      this.$emit('update:modelValue', event.target.value)
    },
  },
}
</script>

<style scoped>
  .article{
    margin-top: 20px;
    min-height: 300px;
  }
</style>