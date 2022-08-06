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
      <button type="button" class="btn btn-dark" @click="login_axios">Submit</button>
    </form>
  </div>

</template>

<script>
import axios from "axios";

export default {
  name: "LoginApp",
  data(){
    return{
      username: '',
      password: '',
      axios_error: '',
    }
  },
  methods:{
    async login_axios(){
      try {
        const response = await axios.post('http://127.0.0.1:8000/api/token/', {
          'username': this.username,
          'password': this.password,
        })
        this.$localStorage.set('access', response.data.access)
        this.$localStorage.set('refresh', response.data.refresh)
        location.reload()
      }
      catch (e) {
        console.log(e)
        this.axios_error = e.response.data.detail
      }
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
</style>