from itertools import chain

from django.db.models import Count
from django.http import request
from rest_framework import serializers
from .models import *


class MeSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    bookmarks = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    followers_count = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'email', 'bookmarks', 'my_articles', 'username', 'sub_user', 'like_count', 'followers_count')

    def get_my_articles(self, instance):
        return Articles.objects.filter(author=instance.id).values_list('id', flat=True)

    def get_bookmarks(self, instance):
        return ArticlesRelation.objects.filter(user=instance, bookmarks=True).values_list('article', flat=True)

    def get_sub_user(self, instance):
        sub1 = UsersSub.objects.filter(subscription=instance, add=True).values_list('user', flat=True)
        sub2 = UsersSub.objects.filter(user=instance, add=True).values_list('subscription', flat=True)
        users = list(chain(sub1, sub2))
        sub_all = Users.objects.filter(pk__in=users).values('first_name', 'last_name', 'username', 'image')
        return sub_all

    def get_like_count(self, instance):
        list_art = Articles.objects.filter(author=instance).values_list(flat=True)
        return ArticlesLikes.objects.filter(article_id__in=list(list_art), likes=True).count()

    def get_followers_count(self, instance):
        return UsersSub.objects.filter(subscription=instance, add=False).count()


class UserSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()
    subscriber_user = serializers.SerializerMethodField()
    choice_user = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    followers_count = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'my_articles', 'username', 'sub_user', 'subscriber_user', 'id', 'choice_user', 'like_count', 'followers_count')

    def get_my_articles(self, instance):
        return Articles.objects.filter(author=instance.id).values_list('id', flat=True)

    def get_sub_user(self, instance):
        sub1 = UsersSub.objects.filter(subscription=instance, add=True).values_list('user', flat=True)
        sub2 = UsersSub.objects.filter(user=instance, add=True).values_list('subscription', flat=True)
        users = list(chain(sub1, sub2))
        sub_all = Users.objects.filter(pk__in=users).values('first_name', 'last_name', 'username', 'image')
        return sub_all

    def get_subscriber_user(self, instance):
        try:
            sub1 = UsersSub.objects.filter(user=self.context['request'].user, subscription=instance, add=False).values_list(flat=True)
            sub2 = UsersSub.objects.filter(user=instance, subscription=self.context['request'].user, add=False).values_list(flat=True)
            subscription = list(chain(sub1, sub2))
            return bool(subscription)
        except:
            return False

    def get_choice_user(self, instance):
        try:
            sub = UsersSub.objects.filter(user=instance, subscription=self.context['request'].user, add=False).values_list(flat=True)
            return bool(sub)
        except:
            return False

    def get_like_count(self, instance):
        list_art = Articles.objects.filter(author=instance).values_list(flat=True)
        return ArticlesLikes.objects.filter(article_id__in=list(list_art), likes=True).count()

    def get_followers_count(self, instance):
        return UsersSub.objects.filter(subscription=instance, add=False).count()




class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.SerializerMethodField()
    count_true = serializers.SerializerMethodField()
    count_false = serializers.SerializerMethodField()
    like_dislike = serializers.SerializerMethodField()
    comment = serializers.SerializerMethodField()

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'like_dislike', 'count_true', 'count_false', 'id', 'author', 'comment')

    def get_comment(self, instance):
        return CommentArticle.objects.filter(article=instance).values_list(flat=True)

    def get_author(self, instance):
        return instance.author.username

    def get_count_true(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=True).count()

    def get_count_false(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=False).count()

    def get_like_dislike(self, instance):
        result = {'like': 0, 'dislike': 0}
        try:
            like_or_dislike = ArticlesLikes.objects.get(article=instance, user=self.context['request'].user)

            if like_or_dislike.likes == True:
                result['like'] = 1
                return result
            elif like_or_dislike.likes == False:
                result['dislike'] = 1
                return result
            else:
                return result

        except:
            return result


class CreateArticleSerializer(serializers.ModelSerializer):
    author = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'author')


class ArticlesRelationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlesRelation
        fields = '__all__'


class ArticlesCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryArticles
        fields = '__all__'


class ArticlesLikesSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlesLikes
        fields = '__all__'


class UsersSubSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsersSub
        fields = '__all__'


class CommentArticleSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    rate_user = serializers.SerializerMethodField()
    rate_count = serializers.SerializerMethodField()

    class Meta:
        model = CommentArticle
        fields = ('user', 'content', 'date', 'id', 'rate_user', 'rate_count', 'reply_first', 'reply_second')

    def get_user(self, instance):
        return instance.user.username

    def get_rate_user(self, instance):
        result = False
        try:
            user = Users.objects.get(username=self.context['request'].user).id
            rate_true = RateComment.objects.filter(comment=instance, rate=True).values_list('user', flat=True)
            rate_false = RateComment.objects.filter(comment=instance, rate=False).values_list('user', flat=True)
            rate = list(chain(rate_true, rate_false))
            if user in rate:
                if user in rate_true:
                    result = 1
                    return result
                result = -1
                return result
            return result
        except:
            return result

    def get_rate_count(self, instance):
        rate_true = RateComment.objects.filter(comment=instance, rate=True).count()
        rate_false = RateComment.objects.filter(comment=instance, rate=False).count()
        return rate_true - rate_false


class CreateCommentArticleSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = CommentArticle
        fields = ('user', 'content', 'date', 'rate', 'reply_first', 'reply_second')

    def create(self, validated_data):
        try:
            if len(self.context['reply']) == 1:
                validated_data['reply_first'] = CommentArticle.objects.get(pk=self.context['reply'][0])
            else:
                validated_data['reply_first'] = CommentArticle.objects.get(pk=self.context['reply'][0])
                validated_data['reply_second'] = CommentArticle.objects.get(pk=self.context['reply'][1])
        except:
            pass
        validated_data['article'] = Articles.objects.get(pk=int(self.context['article']))
        return CommentArticle.objects.create(**validated_data)


class RateCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = RateComment
        fields = '__all__'

