<template>
  <ul class="nav nav-tabs">
      <li class="nav-item">
        <a v-if="tab_team.club" class="nav-link active" aria-current="page" href="#">Club</a>
        <a v-else class="nav-link" aria-current="page" href="#" @click="$router.push('/teams/club')">Club</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Season</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">2021-2022</a></li>
          <li><a class="dropdown-item disabled" href="#">2022-2023</a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a v-if="tab_team.matches" class="nav-link active" href="#">Matches</a>
        <a v-else class="nav-link" href="#">Matches</a>
      </li>
      <li class="nav-item">
        <a v-if="tab_team.line_up" class="nav-link active" href="#">Line-up</a>
        <a v-else class="nav-link" href="#" @click="$router.push('/teams/lineup')">Line-up</a>
      </li>
    </ul>
</template>

<script>
export default {
  name: "MinibarMob",
  props:{
    tab_team:{
      type:Object,
    }
  }
}
</script>

<style scoped>
  .nav-link{
    font-size: 12px;
    color: rgb(100,100,100);
  }
</style>