<template>
  <ProfileCom class="d-none d-md-block"></ProfileCom>
  <ProfileMob class="d-block d-lg-none"></ProfileMob>
</template>

<script>
import ProfileCom from "@/components/ProfileCom";
import ProfileMob from "@/components/ProfileMob";
export default {
  name: "ProfileApp",
  components:{
    ProfileCom,
    ProfileMob,
  }
}
</script>

<style scoped>

</style>