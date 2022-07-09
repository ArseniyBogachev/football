<template>
  <select v-bind:value="modelValue" class="form-select" aria-label=".form-select-sm example" @change="sorted_func">
    <option v-for="option in options" v-bind:value="option.value" class="option_style">{{ option.name }}</option>
  </select>
</template>

<script>
export default {
  name: "SeletedMob",
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
    max-height: 31px;
    max-width: 100px;
    margin-top: 20px;
    font-size: 12px;
  }
</style>