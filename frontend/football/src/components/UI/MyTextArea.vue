<template>
  <textarea type="text" class="form-control article" id="textAreaExample1" v-bind:placeholder="this.placeholder"
            v-bind:value="modelValue" v-bind:rows="this.rows" v-bind:style="this.min_width" @input="text_func">
  </textarea>
</template>

<script>
export default {
  name: "MyTextArea",
  props:{
    modelValue:{
      type: String,
    },
    rows:{
      type: Number,
      default: 4,
    },
    min_width:{
      type: Object,
      default: 100 + '%'
    },
    placeholder:{
      type: String,
      default: ''
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
  }
</style>