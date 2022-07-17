<template>
  <div class="base">
    <h3>Bookmarks</h3>
    <div class="container">
      <div class="card border-secondary mb-3" style="max-width: 50rem;" v-for="bookmark in bookmarks">
        <div class="card-header bg-transparent border-secondary">
          <small class="text-muted">{{ bookmark.username }} | {{ bookmark.date }}</small>
          <div>
            <a href="#"><fa icon="fa-solid fa-trash-can" class="icon-trash"></fa></a>
          </div>
        </div>
        <div class="card-body text-dark">
          <h5 class="card-title">{{ bookmark.title }}</h5>
          <p class="card-text">{{ bookmark.text.slice(0,200) }}...</p>
        </div>
        <a href="#" class="card-footer bg-transparent border-secondary"><span>Open</span></a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MybookmarksCom",
  props:{
    bookmarks:{
      type:Array,
    },
  },
}
</script>

<style scoped>
  h3{
    text-align: center;
    margin-top: 10px;
    font-family: Tahoma, Malgun Gothic, MingLiu, SimSun, Meiryo;
  }
  .card{
    margin-top: 20px;
  }
  .container{
    margin-left: auto;
    margin-right: auto;
    overflow-y: auto;
    height: 37em;
  }
  .container::-webkit-scrollbar {
    width: 7px;
    border-radius: 5px;
    border: 1px solid rgb(100,100,100);
  }
  .container::-webkit-scrollbar-thumb {
    border-radius: 5px;
    background-color: #474345;
  }
  .card-footer{
    text-align: center;
    text-decoration: none;
    color: #1e1a1c;
  }
  .card-footer:hover{
    box-shadow: 0 0 5px 1px darkgray inset;
  }
  .card-footer:active{
    box-shadow: 0 0 10px 5px darkgray inset;
  }
  .card-header{
    display: flex;
    justify-content: space-between;
  }
  .icon-trash{
    color: #2a2628;
  }
  .icon-trash:hover{
    color: #ad1112;
  }
</style>