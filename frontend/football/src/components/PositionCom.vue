<template>
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">Position</th>
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
          <tr v-for="p in position">
            <td>{{ p.position }}</td>
            <td>{{ p.games }}</td>
            <td>{{ p.min }}</td>
            <td>{{ p.goal }}</td>
            <td>{{ p.assist }}</td>
            <td>{{ p.sh90 }}</td>
            <td>{{ p.kp90 }}</td>
            <td>{{ p.xg }}</td>
            <td>{{ p.xa }}</td>
            <td>{{ p.xg90 }}</td>
            <td>{{ p.xa90 }}</td>
          </tr>
        </tbody>
      </table>
    </div>
</template>

<script>
export default {
  name: "PositionCom",
  props:{
    position:{
      type: Array,
    },
  }
}
</script>

<style scoped>

</style>