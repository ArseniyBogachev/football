<template>
  <div class="container-md">
    <h1 class="title">Category Article</h1>
    <hr>
    <div class="wrapper">
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Tactical articles</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about player</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Articles about team</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="wrapper">
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Название карточки</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Название карточки</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
      <div class="card" style="width: 18rem;">
        <img src="../assets/user.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Название карточки</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
  }
  .wrapper{
    padding-top: 70px;
    padding-bottom: 50px;
    display: flex;
    justify-content: space-between;
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
</style>