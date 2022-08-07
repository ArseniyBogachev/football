<template>
  <div class="app">
    <NavBar></NavBar>
    <router-view></router-view>
    <FooTer class="footer"></FooTer>
  </div>
</template>

<script>
import NavBar from "@/pages/NavBar";
import FooTer from "@/pages/FooTer";
import {mapActions} from "vuex";
export default {
  name: 'App',
  components: {
    NavBar,
    FooTer,
  },
  methods:{
    ...mapActions({
      verify_fn: 'verify_fn',
    }),
  },
  created() {
    this.verify_fn({access: localStorage.getItem('access'), refresh: localStorage.getItem('refresh')})
  }
}
</script>

<style>
</style>
