<template>
  <NavbarCom class="d-none d-lg-block"></NavbarCom>
  <NavbarMob class="d-lg-none"></NavbarMob>
</template>

<script>
import NavbarCom from "@/components/NavbarCom";
import NavbarMob from "@/components/NavbarMob";
export default {
  name: "NavBar",
  components:{
    NavbarMob,
    NavbarCom,
  }
}
</script>

<style scoped>

</style>