<template>
  <div class="container-md">
    <ul class="nav nav-tabs">
      <li class="nav-item" v-on:click="$emit('tab_func', Object.keys(tab_team)[0])">
        <a v-if="tab_team.club" class="nav-link active" aria-current="page" href="#">Club</a>
        <a v-else class="nav-link" aria-current="page" href="#">Club</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Season</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">2021-2022</a></li>
          <li><a class="dropdown-item disabled" href="#">2022-2023</a></li>
        </ul>
      </li>
      <li class="nav-item" v-on:click="$emit('tab_func', Object.keys(tab_team)[1])">
        <a v-if="tab_team.matches" class="nav-link active" href="#">Matches</a>
        <a v-else class="nav-link" href="#">Matches</a>
      </li>
      <li class="nav-item" v-on:click="$emit('tab_func', Object.keys(tab_team)[2])">
        <a v-if="tab_team.line_up" class="nav-link active" href="#">Line-up</a>
        <a v-else class="nav-link" href="#">Line-up</a>
      </li>
    </ul>
    <div class="container">
      <div class="row">
        <div class="col-4"><img src="../assets/teams/zenit.svg" class="img-thumbnail" alt="..."></div>
        <div class="col-8">
          <ul>
            <li><fa icon="fa-solid fa-people-group"></fa><span>Zenit</span></li>
            <hr>
            <li><fa icon="fa-solid fa-calendar"></fa><span>1925</span></li>
            <hr>
            <li><fa icon="fa-solid fa-city"></fa><span>St.Petersburg</span></li>
            <hr>
            <li><fa icon="fa-solid fa-chart-area"></fa><span>Gazprom Arena</span></li>
            <hr>
            <li><fa icon="fa-solid fa-trophy"></fa><span>8 × RPL</span><span>3 × Russian cup</span><span>6 × Supercup Russian</span><span>1 × Cup UEFA</span><span>1 × Supercup UEFA</span></li>
            <hr>
            <li><fa icon="fa-solid fa-user-tie"></fa><a href="#" class="link" style="margin-left: 20px">Sergey Semak</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div>
      <h3>Main Stars</h3>
      <div class="card-group">
        <div class="card">
          <img src="../assets/teams/zenit/claudinho.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"><a href="" class="link">Claudinho</a></h5>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
          </div>
          <div class="card-footer">
            <small class="text-muted">Last updated 3 mins ago</small>
          </div>
        </div>
        <div class="card">
          <img src="../assets/teams/zenit/malcom.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"><a href="" class="link">Malcom</a></h5>
            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
          </div>
          <div class="card-footer">
            <small class="text-muted">Last updated 3 mins ago</small>
          </div>
        </div>
        <div class="card">
          <img src="../assets/teams/zenit/lovren.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"><a href="" class="link">Dejan Lovren</a></h5>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
          </div>
          <div class="card-footer">
            <small class="text-muted">Last updated 3 mins ago</small>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ClubCom",
  props:{
    tab_team:{
      type:Object,
    }
  }
}
</script>

<style scoped>
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
  }
  .container-md{
    box-shadow: 0 0 5px 1px gray;
    margin-bottom: 100px;
  }
  .nav-link{
    color: rgb(50,50,50);
  }
  ul{
    list-style: none;
  }
  span{
    margin-left: 20px;
  }
  .link{
    color: rgb(50,50,50);
    text-decoration: none;
  }
  .link:hover{
    color: rgb(130,130,130);
  }
</style>