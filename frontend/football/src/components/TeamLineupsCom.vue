<template>
  <div class="team-lineups">
    <img src="../assets/soccer.jpg" alt="" class="image-soccer">
    <div class="home-players">
      <div class="home-player" style="right: 0"></div>
    </div>
    <div class="guest-players">
      <div class="guest-player" style="right: 0"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TeamLineupsCom"
}
</script>

<style scoped>
  .team-lineups{
    margin-top: 5px;
    width: 600px;
    height: 400px;
    box-shadow: 0 0 5px 1px #757173;
    position: relative;
  }
  .image-soccer{
    width: 600px;
    height: 400px;
  }
  .home-players{
    width: 300px;
    height: 400px;
    position: absolute;
    top: 0;
  }
  .guest-players{
    width: 300px;
    height: 400px;
    position: absolute;
    top: 0;
    right: 0;
  }
  .home-player{
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-color: #1024b0;
    position: absolute;
  }
  .guest-player{
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-color: #b4151e;
    position: absolute;
  }
</style>