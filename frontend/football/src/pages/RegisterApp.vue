<template>
  <div class="container-md">
    <form class="container">
      <div class="name">
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label">Firstname</label>
          <input type="text" class="form-control" id="exampleInputFirstName" style="width: 195px;" v-model="firstname">
        </div>
        <div class="mb-3" style="margin-left: 10px">
          <label for="exampleInputPassword1" class="form-label">Lastname</label>
          <input type="text" class="form-control" id="exampleInputLastName" style="width: 195px;" v-model="lastname">
        </div>
      </div>
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" v-model="email">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Nick name</label>
        <input type="text" class="form-control" id="exampleInputNickName" v-model="nickname">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" v-model="password">
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
      <button type="button" class="btn btn-dark" @click="register_axios">Submit</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "RegisterApp",
  data(){
    return{
      firstname: '',
      lastname: '',
      email: '',
      nickname: '',
      password: '',
      password2: '',
      check_password: false,
    }
  },
  methods:{
    async register_axios(){
      try {
        if (this.password === this.password2){
          const response = await axios.post('http://127.0.0.1:8000/auth/users/', {
            'first_name': this.firstname,
            'last_name': this.lastname,
            'email': this.email,
            'username': this.nickname,
            'password': this.password,
          })
          location.reload()
        }
        else{
          this.check_password = true
        }
      }
      catch (e) {
        console.log(e)
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
    width: 400px;
  }
  input:focus{
    box-shadow: 0 0 5px 1px #a4a0a2 inset;
    border: 1px solid #a4a0a2;
  }
  .container{
    box-shadow: 0 0 5px 1px gray;
    width: 500px;
    padding: 4%;
    height: 650px;
  }
  .mb-3{
  }
  .name{
    display: flex;
  }
</style>