<template>
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
            <th scope="col" v-for="i in Object.keys(table[0])">{{ i }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="s in table">
            <td v-for="item in s">{{ item }}</td>
          </tr>
        </tbody>
      </table>
    </div>
</template>

<script>
export default {
  name: "TableMob",
  props:{
    table:{
      type: Array,
    },
  },
}
</script>

<style scoped>
  tr{
    font-size: 10px;
  }
</style>