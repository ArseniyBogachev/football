<template>
  <MyLoading v-if="loading"></MyLoading>
  <div v-else>
    <TeamsCom class="d-none d-lg-block"
                v-bind:teams="sorted"
                v-model="selected_sort"
                v-bind:options="options"
    ></TeamsCom>
    <TeamsMob class="d-lg-none"
                v-bind:teams="sorted"
                v-model="selected_sort"
                v-bind:options="options"
    ></TeamsMob>
  </div>

</template>

<script>
import TeamsCom from "@/components/TeamsCom";
import TeamsMob from "@/components/TeamsMob";
import MyLoading from "@/components/UI/MyLoading";
import {mapActions, mapGetters} from 'vuex'
export default {
  name: "TeamsApp",
  data(){
    return{
      selected_sort: 'Default',
      options:[
        {'name':'Default', 'value':'Default'},
        {'name':'Position', 'value':'Position'},
        {'name':'XG', 'value':'XG'},
      ],
    }
  },
  components:{
    TeamsMob,
    TeamsCom,
    MyLoading,
  },
  computed:{
    ...mapGetters({
      teams: 'teams',
      loading: 'loading',
    }),
    sorted(){
      if (this.selected_sort === 'Default'){
        return [...this.teams].sort((str1, str2) => (str1.title).localeCompare(str2.title))
      }
      else if (this.selected_sort === 'Position'){
        return [...this.teams].sort((str1, str2) => str1.position - str2.position)
      }
      else{
        return [...this.teams].sort((str1, str2) => str2.xg - str1.xg)
      }
    }
  },
  methods:{
    ...mapActions({
      teams_data: 'teams_data',
    }),
  },
  mounted() {
    this.teams_data()
  }
}
</script>

<style scoped>
  .list-enter-active,
  .list-leave-active {
    transition: all 0.5s ease;
  }
  .list-enter-from,
  .list-leave-to {
    opacity: 0;
    transform: translateX(30px);
  }
</style>