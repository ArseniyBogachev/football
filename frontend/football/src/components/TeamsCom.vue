<template>
  <div class="container-md" style="box-shadow: 0 0 5px 1px darkgray;">
    <div class="container">
      <h3>Russian Premier League</h3>
      <SelectedCom v-model="modelValue" v-bind:options="options" @change="sorted_func"></SelectedCom>
    </div>
    <div class="card mb-3" style="max-width: 840px;" v-for="team in teams">
      <a href="#" @click="$router.push('/teams/club')" style="color: rgb(70,70,70); text-decoration: none;">
        <div class="row g-0">
          <div class="col-md-4"><img v-bind:src="require(`../assets/teams/${team.photo}`)" class="img-fluid img-thumbnail" alt="..."></div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">{{ team.title }}</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту. Этот контент немного длиннее.</p>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Position : {{team.position}}</li>
                <li class="list-group-item">XG : {{team.xg}}</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>
      </a>
    </div>
  </div>
</template>

<script>
import SelectedCom from "@/components/UI/SelectedCom";
export default {
  name: "TeamsCom",
  props:{
    teams:{
      type:Array,
    },
    options:{
      type:Object,
    },
    modelValue:{
      type:String,
    },
  },
  components:{
    SelectedCom,
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
    display: flex;
    justify-content: space-between;
  }
  .container-md{
    margin-bottom: 100px;
  }
  .card{
    position: relative;
    transition: 0.5s;
    margin-top: 50px;
  }
  .card:hover{
    transform: translate(50px, 0);
    transition: 0.5s;
    box-shadow: 0 0 15px 1px rgb(170,170,170) inset;
  }
  .img-thumbnail{
    border-radius: 50%;
    margin: 10px;
  }
  h3{
    padding-top: 20px;
  }
</style>