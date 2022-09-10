<template>
  <div class="comments" v-for="c in sort_reply_comment" v-bind:style="this.min_width_reply">
      <div class="com">
        <small class="author_date">
          {{ c.user }} | {{ c.date }} | <a href="#" class="reply_btn" v-on:click.prevent="c.reply = !c.reply;">Reply &#8628;</a>
        </small>
        <div class="text_rate">
          <CommentRate
              v-bind:rate_count="c.rate_count"
              v-bind:rate_user="c.rate_user"
              v-bind:comment_id="c.id"
          ></CommentRate>
          <p class="text" v-if="c.reply_second">
            {{c.reply_second}}, {{ c.content }}
          </p>
          <p class="text" v-else>
            {{this.reply_first}}, {{ c.content }}
          </p>
        </div>
        <div v-if="c.reply">
          <MyTextArea
            v-model="c.text_reply"
            v-bind:rows="rows_reply"
            v-bind:min_width="min_width_reply"
          ></MyTextArea>
          <button type="button" class="btn btn-dark btn-sm" style="margin-left: 10%"
                  v-on:click.prevent="$emit('comment_create', {data: {'content': c.text_reply}, reply_post: `${reply_id},${c.id}`, reply_data: reply_id}); c.text_reply = '';">
            Send
          </button>
        </div>
      </div>
      <hr>
    </div>
</template>

<script>
import MyTextArea from "@/components/UI/MyTextArea";
import CommentRate from "@/components/UI/CommentRate";
export default {
  name: "CommentReply",
  data(){
    return{
      rows_reply: 1,
    }
  },
  props:{
    comment:{
      type: Array,
    },
    min_width_reply:{
      type: Object,
    },
    reply_first:{
      type: String,
    },
    reply_id:{
      type: Number,
    },
  },
  components:{
    MyTextArea,
    CommentRate,
  },
  computed:{
    sort_reply_comment(){
      let id = String(this.reply_id)
      return this.comment[id]
    }
  }
}
</script>

<style scoped>
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