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


class ArticlesRelationAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArticlesRelation.objects.all()
    serializer_class = ArticlesRelationSerializer
    permission_classes = (IsAuthenticated,)
    lookup_field = 'article'

    def get_object(self):
        obj, create = ArticlesRelation.objects.get_or_create(user=self.request.user,
                                                             article_id=self.kwargs['article'], )
        return obj


class ArticlesCategoryAPIList(generics.ListAPIView):
    queryset = CategoryArticles.objects.all()
    serializer_class = ArticlesCategorySerializer


class ArticlesLikesAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArticlesLikes.objects.all()
    serializer_class = ArticlesLikesSerializer
    permission_classes = (IsAuthenticated, )
    lookup_field = 'article'

    def get_object(self):
        obj, create = ArticlesLikes.objects.get_or_create(user=self.request.user,
                                                          article_id=self.kwargs['article'],)
        return obj


class UsersAPIList(generics.ListAPIView):
    serializer_class = MeSerializer
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        query = Users.objects.filter(username=self.request.user)
        return query


class UsersSubAPIRetrieve(generics.RetrieveAPIView):
    serializer_class = UserSerializer
    lookup_field = 'user'

    def get_object(self):
        query = Users.objects.get(username=self.kwargs['user'])

        return query


class UsersSubAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = UsersSub.objects.all()
    serializer_class = UsersSubSerializer
    permission_classes = (IsAuthenticated,)
    lookup_field = 'user'

    def get_object(self):
        obj, create = UsersSub.objects.get_or_create(user=self.request.user,
                                                     subscription_id=self.kwargs['user'], )
        return obj


class ArticleAPIPost(generics.CreateAPIView):
    queryset = Articles.objects.all()
    serializer_class = CreateArticleSerializer
    permission_classes = (IsAuthenticated,)
# Create your views here.
