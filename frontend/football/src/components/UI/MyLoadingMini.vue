<template>
  <div class="loading">
    <div class="d-flex justify-content-center">
      <div class="spinner-border" role="status" v-bind:style="{width: `${this.size.width}px`, height: `${this.size.height}px`}">
        <span class="visually-hidden">Загрузка...</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyLoadingMini",
  props: {
    size: {
      type: Object,
      default: {
        width: 30,
        height: 30,
      }
    },
  }
}
</script>

<style scoped>
  .loading{
    text-align: center;
  }
</style>