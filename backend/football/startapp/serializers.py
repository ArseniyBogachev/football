from rest_framework import serializers
from .models import *


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model: Users
        fields = '__all__'


class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.SerializerMethodField()
    count_true = serializers.SerializerMethodField()
    count_false = serializers.SerializerMethodField()
    like_true = serializers.SerializerMethodField()
    like_false = serializers.SerializerMethodField()

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'author', 'like_true', 'like_false', 'count_true', 'count_false', 'id')

    def get_author(self, instance):
        return instance.author.username

    def get_count_true(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=True).count()

    def get_count_false(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=False).count()

    def get_like_true(self, instance):
        try:
            return ArticlesLikes.objects.filter(article=instance, likes=True, user=self.context['request'].user).count()
        except:
            return 0

    def get_like_false(self, instance):
        try:
            return ArticlesLikes.objects.filter(article=instance, likes=False, user=self.context['request'].user).count()
        except:
            return 0


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


