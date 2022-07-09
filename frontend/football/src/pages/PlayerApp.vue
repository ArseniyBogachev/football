<template>
  <div class="container-md">
    <div class="container">
      <div class="row">
        <div class="col-4"><img src="../assets/teams/zenit/lovren.png" class="img-thumbnail" alt="..."></div>
        <div class="col-8">
          <ul>
            <li><fa icon="fa-solid fa-circle-user"></fa><span>Dejan Lovren</span></li>
            <hr>
            <li><fa icon="fa-solid fa-calendar"></fa><span>11/05/1989</span></li>
            <hr>
            <li><fa icon="fa-solid fa-earth-europe"></fa><span>Chortia</span></li>
            <hr>
            <li><fa icon="fa-solid fa-city"></fa><span>Bratislava</span></li>
            <hr>
            <li><fa icon="fa-solid fa-trophy"></fa><span>8 × RPL</span><span>3 × Russian cup</span><span>6 × Supercup Russian</span><span>1 × Cup UEFA</span><span>1 × Supercup UEFA</span></li>
            <hr>
            <li><fa icon="fa-solid fa-futbol"></fa><span>Сentre-back</span></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
export default {
  name: "PlayerApp",
  components:{
    MinibarCom,
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px gray;
  }
  .container{
    padding-top: 50px;
  }
  ul{
    list-style: none;
  }
  span{
    margin-left: 20px;
  }
</style>