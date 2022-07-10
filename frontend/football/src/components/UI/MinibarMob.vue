<template>
  <ul class="nav nav-tabs">
      <li class="nav-item" v-for="tab in tab_team">
        <a v-if="tab.active" class="nav-link active" aria-current="page" href="#">{{ tab.name }}</a>
        <a v-else class="nav-link" aria-current="page" href="#" @click="$router.push(`${tab.link}`)">{{ tab.name }}</a>
      </li>
      <li class="nav-item dropdown" v-for="drop in dropdown_menu">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">{{ drop.name }}</a>
        <ul class="dropdown-menu">
          <li v-for="item in drop.item"><a class="dropdown-item" href="#">{{ item }}</a></li>
<!--          <li><a class="dropdown-item disabled" href="#">2022-2023</a></li>-->
        </ul>
      </li>
    </ul>
</template>

<script>
export default {
  name: "MinibarMob",
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
  .nav-link{
    font-size: 12px;
    color: rgb(100,100,100);
  }
</style>