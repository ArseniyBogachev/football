<template>
    <div class="title-sort">
      <h3>Line-Up Zenit</h3>
      <SelectedCom v-model="modelValue" v-bind:options="options" @change="sorted_func"></SelectedCom>
    </div>
    <table class="table table-striped">
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
    <ul>
      <li class="small">Gk - Goalkeeper</li>
      <li class="small">Def - Defender</li>
      <li class="small">Mf - Midfielder</li>
      <li class="small">At - Attack</li>
    </ul>
</template>

<script>
import MinibarCom from "@/components/UI/MinibarCom";
import SelectedCom from "@/components/UI/SelectedCom";
import TableCom from "@/components/UI/TableCom";
export default {
  name: "LineupCom",
  components:{
    MinibarCom,
    SelectedCom,
    TableCom,
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
  .table{
    margin-top: 20px;
  }
  h3{
    margin-top: 20px;
  }
  .link-table{
    display: block;
    width: 100%;
    height: 40px;
    color: rgb(100,100,100);
    text-decoration: none;
  }
  td {
    padding: 0;
    text-align: center;
  }
  th {
    text-align: center;
    padding: 0;
  }
  tbody tr:hover{
    box-shadow: 0 0 15px 1px rgb(130,130,130) inset;
  }
  ul{
    list-style: none;
  }
  .small{
    color: rgba(130,130,130,0.8);
  }
  .title-sort{
    display: flex;
    justify-content: space-between;
  }
</style>