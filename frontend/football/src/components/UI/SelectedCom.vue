<template>
  <select v-bind:value="modelValue" class="form-select" aria-label=".form-select-sm example" @change="sorted_func">
    <option v-for="option in options" v-bind:value="option.value" class="option_style">{{ option.name }}</option>
  </select>
</template>

<script>
export default {
  name: "SelectedCom",
  props:{
    options:{
      type:Object,
    },
    modelValue:{
      type:Object,
    },
  },
  methods:{
    sorted_func(event){
      this.$emit('update:modelValue', event.target.value)
    }
  },
}
</script>

<style scoped>
  .form-select{
    max-height: 50px;
    max-width: 200px;
    margin-top: 20px;
  }
</style>