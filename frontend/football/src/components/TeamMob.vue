<template>
    <div class="container">
      <div class="row">
        <div class="col-4">
          <img src="../assets/teams/zenit.svg" class="img-thumbnail" alt="...">
        </div>
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
            <li><fa icon="fa-solid fa-user-tie"></fa><a href="#" class="link" style="margin-left: 20px; font-size: 12px;">Sergey Semak</a></li>
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
</template>

<script>
import MinibarMob from "@/components/UI/MinibarMob";
export default {
  name: "ClubMob",
  components:{
    MinibarMob,
  },
  props:{
    tab_team:{
      type:Object,
    },
    dropdown_menu:{
      type:Array,
    },
  }
}
</script>

<style scoped>
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
  }
  ul{
    list-style: none;
  }
  span{
    margin-left: 20px;
    font-size: 12px;
  }
  .link{
    color: rgb(50,50,50);
    text-decoration: none;
  }
  .link:hover{
    color: rgb(130,130,130);
  }
</style>