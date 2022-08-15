from itertools import chain
from rest_framework import serializers
from .models import *


class MeSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    bookmarks = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'email', 'bookmarks', 'my_articles', 'username', 'sub_user')

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


class UserSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()
    subscriber_user = serializers.SerializerMethodField()
    choice_user = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'my_articles', 'username', 'sub_user', 'subscriber_user', 'id', 'choice_user')

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


class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.SerializerMethodField()
    count_true = serializers.SerializerMethodField()
    count_false = serializers.SerializerMethodField()
    like_dislike = serializers.SerializerMethodField()

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'author', 'like_dislike', 'count_true', 'count_false', 'id')

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


