from rest_framework import serializers
from .models import *


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model: Users
        fields = '__all__'


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Articles
        fields = '__all__'


class ArticlesRelationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlesRelation
        fields = '__all__'


class ArticlesCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryArticles
        fields = '__all__'
