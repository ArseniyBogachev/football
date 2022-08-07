from rest_framework import serializers
from .models import *


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model: Users
        fields = '__all__'


class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.SerializerMethodField()
    like_true = serializers.SerializerMethodField()
    like_false = serializers.SerializerMethodField()

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'author', 'like_true', 'like_false')

    def get_author(self, instance):
        return instance.author.username

    def get_like_true(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=True).count()

    def get_like_false(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=False).count()


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


