<template>
  <div class="box">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
      <div class="container-fluid">
        <img class="image-user" src="../assets/user.jpg" alt="">
        <a class="navbar-brand" href="#"></a>
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">My subscriptions</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">My article</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Bookmarks</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="nav-small">
      <div class="name">kuwsh1n</div>
      <div class="rate">
        <div class="following"><fa icon="fa-solid fa-users"></fa><span style="margin-left: 5%">28k</span></div>
        <div class="likes" style="margin-left: 15%"><fa icon="fa-solid fa-heart"></fa><span style="margin-left: 5%">100k</span></div>
      </div>
    </div>
    <div class="content">
      рпрпрпрп
    </div>
  </div>
</template>

<script>
export default {
  name: "ProfileMob"
}
</script>

<style scoped>
  .box{
    width: 100%;
    height: 70em;
    margin-top: 102px;
  }
  .image-user{
    max-width: 50px;
    max-height: 50px;
    position: absolute;
    border-radius: 50%;
    top: -30px;
    left: 20px;
    box-shadow: 0 0 5px 1px black;
  }
  .nav-link{
    color: rgb(40, 40, 40);
    font-size: 12px;
  }
  .nav-small{
    width: 100%;
    height: 30px;
    background-color: rgb(150, 150, 150);
    display: flex;
    justify-content: space-between;
    padding: 3px 40px 3px 20px;
  }
  .following{
    font-size: 12px;
    display: flex;
    justify-content: space-between;
  }
  .likes{
    font-size: 12px;
    display: flex;
    justify-content: space-between;
  }
  .rate{
    margin-top: 5px;
    display: flex;
    justify-content: space-between;
  }
  .name{
    font-family: Georgia;
    color: rgb(50, 50, 50);
  }
  .content{
    height: 100%;
    background-color: rgb(220,220,220);
  }
</style>