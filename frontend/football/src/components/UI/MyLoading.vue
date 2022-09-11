<template>
  <label class="d-flex justify-content-center">
    <label class="spinner-border" role="status">
      <span class="visually-hidden">Загрузка...</span>
    </label>
  </label>
</template>

<script>
export default {
  name: "MyLoading",
}
</script>

<style scoped>
  .spinner-border{
    max-height: 24px;
    max-width: 24px;
  }
</style>