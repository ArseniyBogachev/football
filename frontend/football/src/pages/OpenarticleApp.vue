<template>
  <div class="container-md">
    <h3 class="d-none d-sm-block">{{ this.article.title }}</h3>
    <MyBookmarks class="d-none d-xs-block icon"
                 v-bind:article="article"
                 v-bind:arr_id="arr_id"
    ></MyBookmarks>
    <MyBookmarks class="d-xs-none icon-sm"
                 v-bind:article="article"
                 v-bind:arr_id="arr_id"
    ></MyBookmarks>
    <h5 class="d-sm-none">{{ this.article.title }}</h5>
    <span><a href="#" class="author" v-on:click.prevent="$router.push({name: 'user', params: {slug: this.article.author}})">{{this.article.author}}</a> | {{this.article.date}}</span>
    <p class="d-none d-sm-block">{{ this.article.text }}</p>
    <p class="d-sm-none sm-text">{{ this.article.text}}</p>
    <div style="padding-bottom: 50px;">
      <LikesDislikes v-bind:n="this.article"></LikesDislikes>
    </div>
    <CommentsArticle
        v-bind:comment="comment"
        v-bind:comment_reply="comment_reply"
        v-on:comment_create="comment_create"
        v-on:reply_data="reply_data"
    ></CommentsArticle>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
import LikesDislikes from "@/components/UI/LikesDislikes";
import MyBookmarks from "@/components/UI/MyBookmarks";
import CommentsArticle from "@/components/CommentsArticle";
import MyLoading from "@/components/UI/MyLoading";
export default {
  name: "OpenarticleApp",
  props: {
    slug: String,
  },
  components:{
    LikesDislikes,
    MyBookmarks,
    CommentsArticle,
    MyLoading,
  },
  methods:{
    ...mapActions({
      bookmarks_true: 'bookmarks_true',
      bookmarks_false: 'bookmarks_false',
      articles_data: 'articles_data',
      article_comment_data: 'article_comment_data',
      article_comment_create: 'article_comment_create',
      comment_reply_data: 'comment_reply_data',
      comment_reply_create: 'comment_reply_create',
    }),
    async comment_create(data){
      data['article'] = this.article.id
      if (!data['reply_data']){
        await this.article_comment_create(data)
        await this.article_comment_data(data.article)
      }
      else {
        await this.comment_reply_create(data)
        await this.comment_reply_data(data)
      }
    },
    async reply_data(data){
      data['article'] = this.article.id
      await this.comment_reply_data(data)
    },
  },
  computed:{
    ...mapGetters({
      articles_all: 'articles_all',
      verify: 'verify',
      me: 'me',
      comment: 'comment',
      comment_reply: 'comment_reply',
      articles_paginate: 'articles_paginate',
    }),
    article(){
      if ([...this.articles_all].find(item => item.title === this.slug)){
        return [...this.articles_all].find(item => item.title === this.slug)
      }
      else if ([...this.me.bookmarks].find(item => item.title === this.slug)){
        return [...this.me.bookmarks].find(item => item.title === this.slug)
      }
      else{
        return [...this.me.my_articles].find(item => item.title === this.slug)
      }
    },
    arr_id(){
      return [...this.me.bookmarks].map(item => item.id)
    }
  },
  mounted() {
    this.article_comment_data(this.article.id)
  }
}
</script>

<style scoped>
  .container-md{
    box-shadow: 0 0 5px 1px grey;
    margin-bottom: 100px;
    min-height: 658px;
  }
  h3{
    text-align: center;
    padding-top: 5%;
  }
  .sm-text{
    font-size: 14px;
  }
  .author{
    text-decoration: none;
    color: darkgrey;
  }
  .author:hover{
    color: #676365;
    text-decoration: underline;
  }
  div{
    position: relative;
  }
  .icon{
    position: absolute;
    right: 30px;
    top: 70px;
  }
  .icon-sm{
    position: absolute;
    right: 20px;
    top: 40px;
  }
  .icon:hover{
    opacity: 0.8;
  }
  .icon-sm:hover{
    opacity: 0.8;
  }
  h5{
    text-align: center;
    padding-top: 13%;
  }
  span{
    color: darkgrey;
    font-family: Arial, Verdana, Sans-Serif;
    font-size: 12px;
  }
  p{
    font-size: 17px;
    font-family: "Arial Narrow";
  }
</style>