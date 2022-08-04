<template>
  <div class="container-md">
    <form class="container">
      <div class="name">
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label">Firstname</label>
          <input type="text" class="form-control" id="exampleInputFirstName" style="max-width: 195px;" v-model="first_name">
          <small v-if="this.axios_error.first_name" style="color: red" ref="check_password">{{ this.axios_error.first_name[0] }}</small>
        </div>
        <div class="mb-3" style="margin-left: 10px">
          <label for="exampleInputPassword1" class="form-label">Lastname</label>
          <input type="text" class="form-control" id="exampleInputLastName" style="max-width: 195px;" v-model="last_name">
          <small v-if="this.axios_error.last_name" style="color: red" ref="check_password">{{ this.axios_error.last_name[0] }}</small>
        </div>
      </div>
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" v-model="email">
        <small v-if="this.axios_error.email" style="color: red" ref="check_password">{{ this.axios_error.email[0] }}</small>
<!--        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>-->
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Nickname</label>
        <input type="text" class="form-control" id="exampleInputNickName" v-model="username">
        <small v-if="this.axios_error.username" style="color: red" ref="check_password">{{ this.axios_error.username[0] }}</small>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" v-model="password">
        <small v-if="this.axios_error.password" v-for="e in this.axios_error.password" style="color: red" ref="check_password">{{ e }}<br></small>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Reload Password</label>
        <input type="password" class="form-control" id="exampleInputPassword2" v-model="password2">
        <small v-if="this.check_password" style="color: red" ref="check_password">Passwords do not match</small>
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
      </div>
      <button type="button" class="btn btn-dark" @click='register_axios'>Submit</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "RegisterApp",
  data(){
    return{
      first_name: '',
      last_name: '',
      email: '',
      username: '',
      password: '',
      password2: '',
      check_password: false,
      axios_error: {first_name: [], last_name: [], email: [], username: [], password: []},
    }
  },
  methods:{
    async register_axios(){
      try {
        if (this.password === this.password2){
          const response = await axios.post('http://127.0.0.1:8000/auth/users/', {
            'first_name': this.first_name,
            'last_name': this.last_name,
            'email': this.email,
            'username': this.username,
            'password': this.password,
          })
          location.reload()
        }
        else{
          this.check_password = true
        }
      }
      catch (e) {
        for (let i in e.response.data){
          this.axios_error[i] = e.response.data[i]
        }
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
    min-height: 650px;
  }
  .mb-3{
  }
  .name{
    display: flex;
  }
</style>