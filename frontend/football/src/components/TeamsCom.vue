<template>
  <div class="container-md" style="box-shadow: 0 0 5px 1px darkgray;">
    <ul class="nav nav-tabs">
      <li class="nav-item" v-on:click="$emit('sort_func', Object.keys(sort_team)[1])">
        <a v-if="sort_team.position" class="nav-link active" href="#">Position</a>
        <a v-else class="nav-link" href="#">Position</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Season</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">2021-2022</a></li>
          <li><a class="dropdown-item disabled" href="#">2022-2023</a></li>
        </ul>
      </li>
      <li class="nav-item" v-on:click="$emit('sort_func', Object.keys(sort_team)[0])">
        <a v-if="sort_team.xg" class="nav-link active" href="#">Xg</a>
        <a v-else class="nav-link" href="#">Xg</a>
      </li>
      <li class="nav-item" v-on:click="$emit('sort_func', Object.keys(sort_team)[2])">
        <a v-if="sort_team.default_" class="nav-link active" aria-current="page" href="#">Default</a>
        <a v-else class="nav-link" href="#">Default</a>
      </li>
    </ul>
    <div class="card mb-3" style="max-width: 840px;">
      <a href="#" @click="$router.push('/club')" style="color: rgb(70,70,70); text-decoration: none;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="../assets/teams/zenit.svg" class="img-fluid img-thumbnail" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Заголовок карточки</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту. Этот контент немного длиннее.</p>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>
      </a>
    </div>
    <div class="card mb-3" style="max-width: 840px;">
      <a href="" style="color: rgb(70,70,70); text-decoration: none;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="../assets/teams/cska.svg" class="img-fluid img-thumbnail" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Заголовок карточки</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту. Этот контент немного длиннее.</p>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>
      </a>
    </div>
    <div class="card mb-3" style="max-width: 840px;">
      <a href="" style="color: rgb(70,70,70); text-decoration: none;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="../assets/teams/rostov.svg" class="img-fluid img-thumbnail" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Заголовок карточки</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту. Этот контент немного длиннее.</p>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "TeamsCom",
  props:{
    sort_team:{
      type:Object,
    }
  }
}
</script>

<style scoped>
  .nav-link{
    color: black;
  }
  .container-md{
    margin-bottom: 100px;
  }
  .card{
    position: relative;
    transition: 0.5s;
    margin-top: 20px;
  }
  .card:hover{
    transform: translate(50px, 0);
    transition: 0.5s;
    box-shadow: 0 0 15px 1px rgb(170,170,170) inset;
  }
  .img-thumbnail{
    border-radius: 50%;
    margin: 10px;
  }
</style>