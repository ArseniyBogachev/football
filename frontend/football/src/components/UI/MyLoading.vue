<template>
  <div class="loading" v-bind:style="{height: `${this.size.height_em}em`}">
    <div class="d-flex justify-content-center">
      <div class="spinner-border" role="status" v-bind:style="{width: `${this.size.width}px`, height: `${this.size.height}px`}">
        <span class="visually-hidden">Загрузка...</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyLoading",
  props: {
    size: {
      type: Object,
      default: {
        width: 100,
        height: 100,
        height_em: 80,
      }
    },
  }
}
</script>

<style scoped>
  .loading{
    position: relative;
    width: 100%;
  }
  .d-flex{
    position: absolute;
    top: 50%;
    transform: translate(-50px, -250px);
    left: 50%;
  }
</style>