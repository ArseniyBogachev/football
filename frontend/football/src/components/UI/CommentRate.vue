<template>
  <div class="rate">
    <fa v-if="this.rate_user === 1" icon="fa-solid fa-angle-up" style="display: block; color: red;"></fa>
    <a href="#" v-else v-on:click.prevent="comment_rate_update_true({comment_id: this.comment_id, reply_id: this.reply_id})"><fa icon="fa-solid fa-angle-up" style="display: block; color: gray;"></fa></a>
<!--    <fa icon="fa-solid fa-sort-up" style="display: block; color: #b4151e; margin-left: 1px; margin-bottom: -7px"></fa>-->
    <small style="display: block; text-align: center">{{ this.rate_count }}</small>
    <fa v-if="this.rate_user === -1" icon="fa-solid fa-angle-down" style="display: block; color: red;"></fa>
    <a href="#" v-else v-on:click.prevent="comment_rate_update_false({comment_id: this.comment_id, reply_id: this.reply_id})"><fa icon="fa-solid fa-angle-down" style="display: block; color: gray;"></fa></a>
  </div>
</template>

<script>
import {mapActions} from 'vuex';
export default {
  name: "CommentRate",
  props:{
    rate_count: {
      type: Number,
    },
    rate_user: {
      type: Number,
    },
    comment_id: {
      type: Number,
    },
    reply_id: {
      type: Number,
      default: '',
    },
  },
  methods:{
    ...mapActions({
      comment_rate_update_true: 'comment_rate_update_true',
      comment_rate_update_false: 'comment_rate_update_false',
    })
  }
}
</script>

<style scoped>
  .rate{
    margin-top: 10px;
  }
</style>