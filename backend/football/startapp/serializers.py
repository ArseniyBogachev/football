from rest_framework import serializers
from .models import *


class UsersSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'email', 'bookmarks', 'my_articles', 'username')

    def get_my_articles(self, instance):
        return Articles.objects.filter(author=instance.id).values_list('id', flat=True)
        # return Articles.objects.filter(author=instance.id).values()


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


