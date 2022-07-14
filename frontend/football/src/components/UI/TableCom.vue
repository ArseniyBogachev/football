<template>
    <div class="container">
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
  name: "TableCom",
  props:{
    table:{
      type: Array,
    },
  },
}
</script>

<style scoped>

</style>