<template>
  <div class="app">
    <NavBar></NavBar>
    <router-view class="content"></router-view>
    <FooTer class="footer"></FooTer>
  </div>
</template>

<script>
import NavBar from "@/pages/NavBar";
import FooTer from "@/pages/FooTer";
import {mapActions, mapGetters} from "vuex";
export default {
  name: 'App',
  components: {
    NavBar,
    FooTer,
  },
  data(){
    return{
      loading: false,
    }
  },
  methods:{
    ...mapActions({
      verify_fn: 'verify_fn',
    }),
  },
  async created() {
    await this.verify_fn({access: localStorage.getItem('access'), refresh: localStorage.getItem('refresh')})
  },
  computed:{
    ...mapGetters({
      // loading: 'loading'
    })
  }
}
</script>

<style>
  /*.loading{*/
  /*  height: 100%;*/
  /*  width: 100%;*/
  /*  opacity: 0.7;*/
  /*  position: absolute;*/
  /*  z-index: 2;*/
  /*}*/
  /*.app{*/
  /*  position: relative;*/
  /*}*/
  /*.footer{*/
  /*  width: 100%;*/
  /*  position: absolute;*/
  /*  bottom: -150px;*/
  /*}*/
</style>
