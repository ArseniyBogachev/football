<template>
  <div class="rate">
    <div class="following"><fa icon="fa-solid fa-users"></fa><span style="line-height: 15px; margin-left: 4px">{{ user.followers_count }}</span></div>
    <div class="likes" style="margin-left: 20%"><fa icon="fa-solid fa-heart"></fa><span style="line-height: 15px; margin-left: 4px">{{ user.like_count }}</span></div>
  </div>
</template>

<script>
export default {
  name: "FollowersLikesCountMob",
  props:{
    user: Object,
  },
}
</script>

<style scoped>
  .following{
    font-size: 12px;
    color: rgb(70, 70, 70);
    display: flex;
    justify-content: space-between;
  }
  .likes{
    font-size: 12px;
    color: rgb(70, 70, 70);
    display: flex;
    justify-content: space-between;
  }
  .rate{
    margin-top: 5px;
    display: flex;
    justify-content: space-between;
  }
</style>