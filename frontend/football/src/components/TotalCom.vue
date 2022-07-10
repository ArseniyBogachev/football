<template>
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">Season</th>
            <th scope="col">Team</th>
            <th scope="col">Games</th>
            <th scope="col">Min</th>
            <th scope="col">G</th>
            <th scope="col">A</th>
            <th scope="col">Sh90</th>
            <th scope="col">KP90</th>
            <th scope="col">xG</th>
            <th scope="col">xA</th>
            <th scope="col">xG90</th>
            <th scope="col">xA90</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="t in total">
            <td>{{ t.season }}</td>
            <td>{{ t.team }}</td>
            <td>{{ t.games }}</td>
            <td>{{ t.min }}</td>
            <td>{{ t.goal }}</td>
            <td>{{ t.assist }}</td>
            <td>{{ t.sh90 }}</td>
            <td>{{ t.kp90 }}</td>
            <td>{{ t.xg }}</td>
            <td>{{ t.xa }}</td>
            <td>{{ t.xg90 }}</td>
            <td>{{ t.xa90 }}</td>
          </tr>
        </tbody>
      </table>
    </div>
</template>

<script>
export default {
  name: "TotalCom",
  props:{
    total:{
      type: Array,
    },
  },
}
</script>

<style scoped>

</style>