<template>
  <footer class="bg-dark text-center text-white">
    <div class="container p-4 pb-0">
      <section class="mb-4">
        <a class="btn btn-outline-light btn-floating m-1" href="#!" target="_blank" role="button"
          ><fa icon="fa-brands fa-instagram"></fa
        ></a>
        <a class="btn btn-outline-light btn-floating m-1" href="https://github.com/ArseniyBogachev/football" target="_blank" role="button"
          ><fa icon="fa-brands fa-github"></fa
        ></a>
        <a class="btn btn-outline-light btn-floating m-1" href="https://t.me/kuwsh1n" target="_blank" role="button"
          ><fa icon="fa-brands fa-telegram"></fa
        ></a>
      </section>
    </div>

    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); color: gray">
      © 2022 Copyright:
      <a class="text-white" v-bind:href="url" style="color: gray">FAnalytics.com</a>
    </div>
  </footer>
</template>

<script>
export default {
  name: "FooTer",
  data(){
    return{
      url: process.env.VUE_APP_URL,
    }
  }
}
</script>

<style scoped>

</style>