<template>
  <div class="loading">
    <div class="d-flex justify-content-center">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Загрузка...</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyLoadingMini"
}
</script>

<style scoped>
  .loading{
    text-align: center;
  }
</style>