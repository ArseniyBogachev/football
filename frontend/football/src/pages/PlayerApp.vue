<template>
  <MyLoading v-if="loading"></MyLoading>
  <div v-else>
    <PlayerCom class="d-none d-lg-block"
               v-bind:player="player"
    ></PlayerCom>
    <PlayerMob class="d-lg-none container"
               v-bind:player="player"
    ></PlayerMob>
  </div>
</template>

<script>
import PlayerCom from "@/components/PlayerCom";
import PlayerMob from "@/components/PlayerMob";
import {mapActions, mapGetters} from 'vuex'
import MyLoading from "@/components/UI/MyLoading";
export default {
  name: "PlayerApp",
  components:{
    PlayerMob,
    PlayerCom,
    MyLoading,
  },
  props: {
    slug: {
      type: String,
    }
  },
  methods:{
    ...mapActions({
      player_data: 'player_data',
    }),
  },
  computed: {
    ...mapGetters({
      player: 'player',
      loading: 'loading',
    }),
  },
  created() {
    this.player_data(this.slug)
  },
}
</script>

<style scoped>
</style>