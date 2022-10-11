<template>
  <div class="container-md" style="box-shadow: 0 0 5px 1px darkgray;">
    <div>
      <h5>Russian Premier League</h5>
      <SelectedMob v-model="modelValue" v-bind:options="options" @change="sorted_func"></SelectedMob>
    </div>
    <div class="card mb-3" style="max-width: 840px;" v-for="team in teams">
      <a href="#" @click.prevent="$router.push(`/teams/club/${team.title}`)" style="color: rgb(70,70,70); text-decoration: none;">
        <div class="row g-0">
          <div class="col-md-4"><img v-bind:src="`http://127.0.0.1:8000${team.image}`" class="img-fluid img-thumbnail" alt="..."></div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">{{ team.title }}</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту. Этот контент немного длиннее.</p>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Position : {{team.position}}</li>
                <li class="list-group-item">XG : 1</li>
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
import SelectedMob from "@/components/UI/SeletedMob";
export default {
  name: "TeamsMob",
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
    SelectedMob,
  },
    methods:{
    sorted_func(event){
      this.$emit('update:modelValue', event.target.value)
    }
  },
}
</script>

<style scoped>
  .card{
    margin-left: auto;
    margin-right: auto;
    transition: 0.1s;
    margin-top: 20px;
    padding-bottom: 20px;
  }
  .card:active{
    box-shadow: 0 0 15px 1px rgb(140,140,140) inset;
    transition: 0.1s;
  }
  .img-thumbnail{
    border-radius: 50%;
    width: 150px;
    height: 150px;
    margin: 10px;
  }
  .card-body{
    font-size: 12px;
  }
  h5{
    padding-top:20px;
  }
</style>