<template>
  <div>
    <h1 class="title">Category Article</h1>
    <hr>
    <div class="wrapper">
      <div class="card" style="width: 80%;">
        <img src="../assets/tactical.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Tactical articles</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 80%;">
        <img src="../assets/player.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about player</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 80%">
        <img src="../assets/team.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about team</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="wrapper">
      <div class="card" style="width: 80%;">
        <img src="../assets/xg2.webp" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about XG</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 80%;">
        <img src="../assets/manager.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about managers</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 80%;">
        <img src="../assets/transfer.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about transfers</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ArticleApp",
}
</script>

<style scoped>
  .wrapper{
    padding: 5%;
  }
  .title{
    text-align: center;
    padding-top: 50px;
    font-family: "system-ui";
  }
  .btn-primary{
    background-color: gray;
    border: 1px solid rgb(100,100,100);
  }
  .card{
    margin-top: 100px;
    margin-left: auto;
    margin-right: auto;
    height: 10%;
  }
</style>