<template>
  <nav class="navbar expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <div class="nav-item dropdown" style="margin-top: 10px">
          <a class="nav-link dropdown" href="#" id="user-m" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
            <img v-if="user.image" class="image-user-m" v-bind:src="user.image"/>
            <fa class="icon-user" v-else icon="user"></fa>
          </a>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start" aria-labelledby="user-m" style="left: 0">
            <li><a class="dropdown-item" href="#" @click="$router.push('/profile')">Profile</a></li>
            <li><a class="dropdown-item" href="#" @click="$router.push('/settings')">Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </div>

        <div class="user_search">

          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Players" aria-label="Search" v-bind:value="modelValue" v-on:input="input_func">
          </form>
          <ul class="nav flex-column search_item" v-if="modelValue && players.length > 0">
            <li v-for="p in players.slice(0,5)" class="nav-item player">
              <a href="" class="nav-link link"><span>{{ p.firstname}} {{p.lastname}}</span> <small class="text-muted">Zenit</small></a>
            </li>
          </ul>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
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
  name: "NavbarMob",
  props:{
    modelValue:{
      type: String,
    },
    players:{
      type: Array,
    },
    user:{
      type: Object,
    },
  },
  methods:{
    input_func(event){
      this.$emit('update:modelValue', event.target.value)
    }
  },
}
</script>

<style scoped>
  .form-control{
    width: 150px;
  }
  .form-control:focus{
    box-shadow: 0 0 5px 1px #807c7e inset;
  }
  .link{
    color: white;
    text-decoration: none;
    display: flex;
    justify-content: space-between;
  }
  .link:active{
    background-color: #a4a0a2;
    color: #1e1a1c;
  }
  .link:hover{
    color: #1e1a1c;
  }
  .search_item{
    position: absolute;
    width: 150px;
    background-color: #474345;
    z-index: 2;
    top: 50px;
    list-style: none;
    box-shadow: 0 0 5px 1px #2a2628;
  }
  .user_search{
    display: flex;
    position: relative;
  }
  .dropdown-item:active{
    background-color: gray;
  }
  .icon-user{
    color: gray;
    border: 1px solid gray;
    border-radius: 40%;
    padding: 4px;
  }
  .image-user-m{
    width: 20px;
    height: 20px;
    border-radius: 50%;
    border: 1px solid gray;
    margin-bottom: 10px;
  }
</style>