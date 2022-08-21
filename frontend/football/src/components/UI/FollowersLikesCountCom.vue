<template>
        <p class="followers-md-none d-none d-lg-block">
          <span>{{ user.followers_count }} followers</span>
        </p>
        <p class="followers-md d-none d-md-block d-lg-none">
          <span>{{ user.followers_count }} followers</span>
        </p>
        <p class="like-md-none d-none d-lg-block">
          <span>{{ user.like_count }} likes</span>
        </p>
        <p class="like-md d-none d-md-block d-lg-none">
          <span>{{ user.like_count }} likes</span>
        </p>
</template>

<script>
export default {
  name: "FollowersLikesCountCom",
  props:{
    user: Object,
  }
}
</script>

<style scoped>
  .followers-md-none{
    position: absolute;
    color: gray;
    top: 30px;
    font-size: 20px;
    font-family: "Droid Serif";
  }
  .followers-md{
    position: absolute;
    color: gray;
    top: 70px;
    font-size: 15px;
    font-family: "Droid Serif";
  }
  .like-md-none{
    position: absolute;
    color: gray;
    right: 10px;
    top: 30px;
    font-size: 20px;
    font-family: "Droid Serif";
  }
  .like-md{
    position: absolute;
    color: gray;
    top: 70px;
    right: 10px;
    font-size: 15px;
    font-family: "Droid Serif";
  }
</style>