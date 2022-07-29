<template>
  <nav class="navbar navbar-expand-lg navbar-default bg-dark" style="box-shadow: 0 0 5px 1px darkgray">
    <div class="container-lg">
        <div class="navbar-header">
          <a href="#" class="navbar-brand" @click.prevent="$router.push('/')" style="color: gray">Football analytics</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#" @click.prevent="$router.push('/')" class="nav-link" style="color: gray">Home</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: gray">
                Teams
              </a>
              <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#" @click.prevent="$router.push('/teams')">Russian PL</a></li>
                <li><a class="dropdown-item" href="#" @click.prevent="$router.push('/teams')">FNL</a></li>
              </ul>
            </li>
            <li><a href="#" class="nav-link" @click.prevent="$router.push('/article')" style="color: gray">Article</a></li>
            <li><a href="#" @click.prevent="$router.push('/about')" class="nav-link" style="color: gray">About</a></li>
          </ul>
        </div>

        <div class="user_search">
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Players" aria-label="Search" v-bind:value="modelValue" v-on:input="input_func">
          </form>
          <ul class="nav flex-column search_item" v-if="modelValue && players.length > 0" @click="close_search">
            <li v-for="p in players.slice(0,5)" class="nav-item player">
              <a href="#" class="nav-link link" @click.prevent="$router.push(`/teams/lineup/${p.lastname}`); modelValue = '';"><span>{{ p.firstname}} {{p.lastname}}</span> <small class="text-muted">Zenit</small></a>
            </li>
          </ul>
          <div v-if="false">
            <ul class="nav navbar-nav" style="margin-left: 10px;">
              <li><a href="#" class="nav-link"  style="color: gray">Login</a></li>
              <li><a href="#" class="nav-link" style="color: gray">Register</a></li>
            </ul>
          </div>
          <div v-else>
            <ul class="nav navbar-nav" style="margin-left: 20px;">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown border-gray" href="#" role="button" id="user" data-bs-toggle="dropdown" aria-expanded="false">
                  <fa class="icon-user" v-if="true" icon="user"></fa>
                  <img v-else class="image-user" src="../assets/user.jpg"/>
                  <span class="name">Arseniy</span>
                </a>
                <ul class="dropdown-menu bg-light" aria-labelledby="user">
                  <li><a class="dropdown-item" href="#" @click="$router.push({name: 'profile', params: {slug: user.nickname}})">Profile</a></li>
<!--                  <li><a class="dropdown-item" href="#" @click="$router.push('/settings')">Settings</a></li>-->
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "NavbarCom",
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
    },
    close_search(event){
      if (!event){
        this.modelValue = ''
      }
    },
  },
}
</script>

<style scoped>
  .link{
    color: white;
    text-decoration: none;
    display: flex;
    justify-content: space-between;
  }
  .link:hover{
    background-color: #a4a0a2;
    color: #1e1a1c;
  }
  .search_item{
    position: absolute;
    width: 207px;
    background-color: #474345;
    z-index: 2;
    top: 50px;
    list-style: none;
    box-shadow: 0 0 5px 1px black;
  }
  .user_search{
    display: flex;
    position: relative;
  }
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
  .form-control:focus{
    box-shadow: 0 0 5px 1px gray inset;
  }
</style>