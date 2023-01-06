<template>
  <div class="container-md">
    <form class="container">
      <small v-if="this.axios_error" style="color: red" ref="check_password">{{ this.axios_error }}</small>
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Nickname</label>
        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="usernameHelp" v-model="username">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" v-model="password">
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
      </div>
      <button type="button" class="btn btn-secondary" @click="login_axios">
        <MyLoadingMini v-if="click_loading" v-bind:size="size"></MyLoadingMini>
        <span v-else>Submit</span>
      </button>
    </form>
  </div>

</template>

<script>
import axios from "axios";
import router from "@/router/router";
import {mapActions, mapGetters, mapMutations} from "vuex"
import {nextTick} from "vue";
import MyLoading from "@/components/UI/MyLoading";
import MyLoadingMini from "@/components/UI/MyLoadingMini";
export default {
  name: "LoginApp",
  components:{
    MyLoadingMini,
    MyLoading,
  },
  data(){
    return{
      username: '',
      password: '',
      axios_error: '',
      size: {
        width: 24,
        height: 24,
      }
    }
  },
  methods:{
    ...mapActions({
      verify_fn: 'verify_fn',
      me_data: 'me_data',
      articles_data: 'articles_data'
    }),
    ...mapMutations({
      updateClickLoading: 'updateClickLoading',
      pageOne: 'PageOne',
      updateArticles: 'updateArticles',
    }),
    async login_axios(){
      try {
        if (this.username && this.password){
          this.updateClickLoading('true')
          const response = await axios.post('http://127.0.0.1:8000/api/token/', {
            'username': this.username,
            'password': this.password,
          })
          localStorage.setItem("access", response.data.access);
          localStorage.setItem("refresh", response.data.refresh);
          await this.verify_fn({access: localStorage.getItem('access'), refresh: localStorage.getItem('refresh')})
          await this.pageOne()
          await this.updateArticles([])
          this.updateClickLoading('false')
          this.$forceUpdate()
          router.push('/')
        }
        else{
          this.axios_error = 'Please, field placeholder.'
        }
      }
      catch (e) {
        this.axios_error = e.response.data.detail
        this.loading = false
      }
    }
  },
  computed:{
    ...mapGetters({
      click_loading: 'click_loading',
    }),
  },
  created() {
    if (!this.verify){
      this.me_data(localStorage.getItem('access'))
    }
  }
}
</script>

<style scoped>
  .container-md{
    height: 758px;
  }
  .form-control{
    max-width: 400px;
  }
  input:focus{
    box-shadow: 0 0 5px 1px #a4a0a2 inset;
    border: 1px solid #a4a0a2;
  }
  .container{
    box-shadow: 0 0 5px 1px gray;
    max-width: 500px;
    padding: 4%;
    min-height: 500px;
  }
  .mb-3{
    margin-top: 30px;
  }
  .btn{
    min-width: 150px;
  }
  .btn-secondary:active{
    box-shadow: 0 0 15px 10px white inset;
  }
  .btn-secondary:focus{
    box-shadow: 0 0 0 0.2rem white !important;
  }
</style>