<template>
  <nav class="navbar navbar-expand-lg navbar-default bg-dark" style="box-shadow: 0 0 5px 1px darkgray">
    <div class="container-lg">
        <div class="navbar-header">
          <a href="#" class="navbar-brand" @click="$router.push('/')" style="color: gray">Football analytics</a>
        </div>

        <div class="d-lg-none btn-group mb-2" style="color: gray; margin-top: 12px">
          <a class="nav-link dropdown" href="#" id="navbar-dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
            MENU
          </a>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start" aria-labelledby="navbar-dropdown">
            <li><a class="dropdown-item" href="#">Teams</a></li>
            <li><a class="dropdown-item" href="#">Article</a></li>
            <li><a class="dropdown-item" href="#">About</a></li>
            <li><a class="dropdown-item" href="#">Link</a></li>
            <li v-if="true"><hr class="dropdown-divider"></li>
            <li v-if="true"><a class="dropdown-item" href="#">Login</a></li>
            <li v-if="true"><a class="dropdown-item" href="#">Register</a></li>
          </ul>
        </div>

        <div class="d-none d-lg-block">
          <ul class="nav navbar-nav">
            <li><a href="#" @click="$router.push('/')" class="nav-link" style="color: gray">Home</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
                Teams
              </a>
              <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Premier League</a></li>
                <li><a class="dropdown-item" href="#">EFL Championship</a></li>
                <li><a class="dropdown-item" href="#">EFL League One</a></li>
                <li><a class="dropdown-item" href="#">EFL League Two</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">National League</a></li>
                <li><a class="dropdown-item" href="#">National League North</a></li>
                <li><a class="dropdown-item" href="#">National League South</a></li>
              </ul>
            </li>
            <li><a href="#" class="nav-link"  style="color: gray">Article</a></li>
            <li><a href="#" @click="$router.push('/about')" class="nav-link" style="color: gray">About</a></li>
            <li><a href="#" class="nav-link" style="color: gray">Link</a></li>
          </ul>
        </div>

        <div v-if="false" class="d-none d-lg-block">
          <ul class="nav navbar-nav">
            <li><a href="#" class="nav-link"  style="color: gray">Login</a></li>
            <li><a href="#" class="nav-link" style="color: gray">Register</a></li>
          </ul>
        </div>
        <div v-else class="d-none d-lg-block">
          <ul class="nav navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown border-gray" href="#" role="button" id="user" data-bs-toggle="dropdown" aria-expanded="false">
                <fa class="icon-user" v-if="true" icon="user"></fa>
                <img v-else class="image-user" src="../assets/user.jpg"/>
                <span class="name">Arseniy</span>
              </a>
              <ul class="dropdown-menu bg-light" aria-labelledby="user">
                <li><a class="dropdown-item" href="#" @click="$router.push('/profile')">Profile</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Logout</a></li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="d-lg-none btn-group mb-2" style="margin-top: 10px">
          <a class="nav-link dropdown" href="#" id="user-m" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
            <fa class="icon-user" v-if="false" icon="user"></fa>
            <img v-else class="image-user-m" src="../assets/user.jpg"/>
          </a>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start" aria-labelledby="user-m">
            <li><a class="dropdown-item" href="#" @click="$router.push('/profile')">Profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "NavBar"
}
</script>

<style scoped>
  .dropdown-item:active{
    background-color: gray;
  }
  .image-user{
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 1px solid gray;
  }
  .name{
    color: gray;
    margin-left: 10px;
    font-size: 12px;
    font-family: "Arial Unicode MS";
    letter-spacing: 3px;
  }
  .icon-user{
    color: gray;
  }
  .border-gray{
    border: 1px solid gray;
    border-radius: 6px;
    width: 150px;
    height: 45px;
    text-align: center;
  }
  .border-gray:focus{
    box-shadow: 0 0 5px 1px black inset;
  }
  .image-user-m{
    width: 17px;
    height: 17px;
    border-radius: 50%;
    border: 1px solid gray;

  }
</style>