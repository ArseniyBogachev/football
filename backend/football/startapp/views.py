from django.shortcuts import render
from django.views.generic import ListView
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Articles
from .serializers import *


class ArticlesAPIList(generics.ListAPIView):
    queryset = Articles.objects.all()
    serializer_class = ArticleSerializer


# изменить view bookmarks с list на update
class ArticlesRelationAPIList(generics.ListAPIView):
    queryset = ArticlesRelation.objects.all()
    serializer_class = ArticlesRelationSerializer


class ArticlesCategoryAPIList(generics.ListAPIView):
    queryset = CategoryArticles.objects.all()
    serializer_class = ArticlesCategorySerializer


class ArticlesLikesAPIUpdate(generics.UpdateAPIView):
    queryset = ArticlesLikes.objects.all()
    serializer_class = ArticlesLikesSerializer
    permission_classes = (IsAuthenticated, )
    lookup_field = 'article'

    def get_object(self):
        obj, create = ArticlesLikes.objects.get_or_create(user=self.request.user,
                                                          article_id=self.kwargs['article'],)
        return obj
# Create your views here.
