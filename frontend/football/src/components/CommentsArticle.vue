<template>
  <div class="wrapper">
    <span style="font-size: 20px; font-family: 'Apple Chancery';">Comments {{comment.length}}</span>
    <MyTextArea
        v-model="text_comment"
        v-bind:rows="rows_comment"
    ></MyTextArea>
    <button type="button" class="btn btn-dark btn-sm"
            v-on:click.prevent="$emit('comment_create', {data: {'content': this.text_comment, reply: ''}}); text_comment = '';">
      Send
    </button>
    <div class="comments" v-for="c in comment">
      <div class="com">
        <small class="author_date" v-if="c.reply">
          {{ c.user }} | {{ c.date }} | <a href="#" class="reply_btn" v-on:click.prevent="c.reply = !c.reply;">Hide &#8613;</a>
        </small>
        <small class="author_date" v-else>
          {{ c.user }} | {{ c.date }} | <a href="#" class="reply_btn" v-on:click.prevent="$emit('reply_data', {reply_data: c.id}); c.reply = !c.reply;">Reply &#8628;</a>
        </small>
        <div class="text_rate">
          <CommentRate
              v-bind:rate_count="c.rate_count"
              v-bind:rate_user="c.rate_user"
              v-bind:comment_id="c.id"
          ></CommentRate>
          <p class="text">
            {{ c.content }}
          </p>
        </div>
        <div v-if="c.reply">
          <MyTextArea
            v-model="c.text_reply"
            v-bind:rows="rows_reply"
            v-bind:min_width="min_width_reply"
          ></MyTextArea>
          <button type="button" class="btn btn-dark btn-sm" style="margin-left: 10%"
                  v-on:click.prevent="$emit('comment_create', {data: {'content': c.text_reply}, reply_post: c.id, reply_data: c.id}); c.text_reply = '';">
            Send
          </button>
          <CommentReply
              v-bind:comment="comment_reply"
              v-bind:min_width_reply="min_width_reply"
              v-bind:reply_first="c.user"
              v-bind:reply_id="c.id"
              v-on:comment_create="doSomething"
          ></CommentReply>
        </div>
      </div>
      <hr>
    </div>
  </div>
</template>

<script>
import MyTextArea from "@/components/UI/MyTextArea";
import CommentRate from "@/components/UI/CommentRate";
import CommentReply from "@/components/CommentReply";
import {mapActions} from 'vuex';
export default {
  name: "CommentsArticle",
  props:{
    comment:{
      type: Array,
    },
    comment_reply:{
      type: Object,
    },
  },
  components: {
    MyTextArea,
    CommentRate,
    CommentReply,
  },
  data(){
    return{
      text_comment: '',
      rows_comment: 4,
      rows_reply: 1,
      min_width_reply: {
        maxWidth: 90 + '%',
        marginLeft: 10 + '%'
      },
    }
  },
  methods: {
    ...mapActions({
      article_comment_create: 'article_comment_create',
    }),
    doSomething(data) {
      this.$emit('comment_create', data)
    },
  }
}
</script>

<style scoped>
  .wrapper{
    position: relative;
  }
  .comments{
    /*list-style: none;*/
    margin-top: 20px;
  }
  .com{

  }
  .author_date{
    color: darkgrey;
    font-family: Arial, Verdana, Sans-Serif;
    font-size: 12px;
  }
  .text_rate{
    display: flex;
  }
  .text{
    margin-left: 20px;
  }
  .reply_btn{
    text-decoration: none;
    color: darkgray;
  }
  .reply_btn:hover{
    color: #676365;
  }
  .btn{
    margin-top: 5px;
  }
  .article{
    min-height: 50px;
  }
</style>