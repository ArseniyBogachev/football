<template>
  <div class="container-md">
    <form class="container">
      <div class="name">
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label">Password</label>
          <input type="password" class="form-control" id="exampleInputFirstName" style="width: 195px;">
        </div>
        <div class="mb-3" style="margin-left: 10px">
          <label for="exampleInputPassword1" class="form-label">Password</label>
          <input type="password" class="form-control" id="exampleInputLastName" style="width: 195px;">
        </div>
      </div>

      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Nick name</label>
        <input type="password" class="form-control" id="exampleInputNickName">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Reload Password</label>
        <input type="password" class="form-control" id="exampleInputPassword2">
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>

</template>

<script>
export default {
  name: "RegisterApp"
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