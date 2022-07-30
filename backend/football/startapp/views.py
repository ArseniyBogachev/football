from django.shortcuts import render
from django.views.generic import ListView
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Articles
from .serializers import *


class ArticlesAPIList(generics.ListAPIView):
    queryset = Articles.objects.all()
    serializer_class = ArticleSerializer


class ArticlesRelationAPIList(generics.ListAPIView):
    queryset = ArticlesRelation.objects.all()
    serializer_class = ArticlesRelationSerializer


class ArticlesCategoryAPIList(generics.ListAPIView):
    queryset = CategoryArticles.objects.all()
    serializer_class = ArticlesCategorySerializer
# Create your views here.
