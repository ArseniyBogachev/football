<template>
  <nav class="navbar expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <div class="nav-item dropdown" style="margin-top: 10px">
          <a class="nav-link dropdown" href="#" id="user-m" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
            <fa class="icon-user" v-if="false" icon="user"></fa>
            <img v-else class="image-user-m" src="../assets/user.jpg"/>
          </a>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start" aria-labelledby="user-m" style="left: 0">
            <li><a class="dropdown-item" href="#" @click="$router.push('/profile')">Profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Teams
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="position: absolute">
                <li><a class="dropdown-item" href="#" @click="$router.push('/teams')">Russian PL</a></li>
                <li><a class="dropdown-item" href="#" @click="$router.push('/teams')">FNL</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" @click="$router.push('/article')">Article</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
          </ul>
        </div>
      </div>
  </nav>

</template>

<script>
export default {
  name: "NavbarMob"
}
</script>

<style scoped>
  .dropdown-item:active{
    background-color: gray;
  }
  .icon-user{
    color: gray;
  }
  .image-user-m{
    width: 20px;
    height: 20px;
    border-radius: 50%;
    border: 1px solid gray;

  }
</style>