<template>
  <div class="app">
    <NavBar></NavBar>
    <router-view></router-view>
    <FooTer></FooTer>
  </div>
</template>

<script>
import NavBar from "@/pages/NavBar";
import FooTer from "@/pages/FooTer";
export default {
  name: 'App',
  components: {
    NavBar,
    FooTer,
  }
}
</script>

<style>

</style>
