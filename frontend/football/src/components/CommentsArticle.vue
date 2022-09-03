<template>
  <div class="wrapper">
    <span style="font-size: 20px; font-family: 'Apple Chancery';">Comments</span>
    <MyTextArea
        v-model="text_comment"
        v-bind:rows="rows_comment"
    ></MyTextArea>
    <button type="button" class="btn btn-dark btn-sm" v-on:click.prevent="$emit('comment_create', {data: {'content': this.text_comment}}); text_comment = ''">Send</button>
    <div class="comments" v-for="c in comment">
      <div class="com"><small class="author_date">{{ c.user }} | {{ c.date }} | <a href="#" class="reply_btn" v-on:click.prevent="c.reply = !c.reply">Reply &#8628;</a></small>
        <div class="text_rate">
          <CommentRate></CommentRate>
          <p class="text">
            {{ c.content }}
          </p>
        </div>
        <div v-if="c.reply">
          <MyTextArea
            v-model="text_reply"
            v-bind:rows="rows_reply"
            v-bind:min_width="min_width_reply"
          ></MyTextArea>
          <button type="button" class="btn btn-dark btn-sm" style="margin-left: 10%">Send</button>
        </div>
      </div>
      <hr>
    </div>
  </div>
</template>

<script>
import MyTextArea from "@/components/UI/MyTextArea";
import CommentRate from "@/components/UI/CommentRate";
import {mapActions} from 'vuex';
export default {
  name: "CommentsArticle",
  props:{
    comment:{
      type: Array,
    }
  },
  components: {
    MyTextArea,
    CommentRate,
  },
  data(){
    return{
      text_comment: '',
      text_reply: '',
      rows_comment: 4,
      rows_reply: 1,
      min_width_reply: {
        maxWidth: 90 + '%',
        marginLeft: 10 + '%'
      }
    }
  },
  methods:{
    ...mapActions({
      article_comment_create: 'article_comment_create',
    })
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