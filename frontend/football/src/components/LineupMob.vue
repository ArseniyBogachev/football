<template>
    <div class="title-sort">
      <h5>Line-Up Zenit</h5>
      <SeletedMob v-model="modelValue" v-bind:options="options" @change="sorted_func"></SeletedMob>
    </div>
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <th scope="col" v-for="i in Object.keys(players[0])">{{ i }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="player in players">
            <td v-for="item in player"><a @click="$router.push(`/teams/lineup/${player.lastname}`)" class="link-table" href="">{{ item }}</a></td>
          </tr>
        </tbody>
      </table>
    </div>
    <ul>
      <li class="small">Gk - Goalkeeper</li>
      <li class="small">Def - Defender</li>
      <li class="small">Mf - Midfielder</li>
      <li class="small">At - Attack</li>
    </ul>
</template>

<script>
import MinibarMob from "@/components/UI/MinibarMob";
import SeletedMob from "@/components/UI/SeletedMob";
export default {
  name: "LineupMob",
  components:{
    MinibarMob,
    SeletedMob,
  },
  props:{
    tab_team:{
      type: Object,
    },
    players:{
      type: Object,
    },
    options:{
      type:Object,
    },
    modelValue:{
      type:String,
    },
    dropdown_menu:{
      type: Array,
    },
  },
  methods:{
    sorted_func(event){
      this.$emit('update:modelValue', event.target.value)
    }
  },
}
</script>

<style scoped>
  .container{
    margin-top: 20px;
    margin-bottom: 50px;
  }
  .table{
    margin-top: 20px;
  }
  h5{
    margin-top: 20px;
  }
  td{
    font-size: 10px;
    padding: 0;
    text-align: center;
  }
  th{
    font-size: 10px;
    text-align: center;
    padding: 0;
  }
  .link-table{
    display: block;
    width: 100%;
    height: 40px;
    color: rgb(80,80,80);
    text-decoration: none;
  }
  ul{
    list-style: none;
  }
  .small{
    color: rgba(130,130,130,0.8);
    font-size: 7px;
  }
  .title-sort{
    display: flex;
    justify-content: space-between;
  }
</style>