import requests
from django.http import HttpResponse
from django.shortcuts import render, redirect
from rest_framework import generics, viewsets
from rest_framework.generics import GenericAPIView
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.response import Response
from .models import Articles
from .serializers import *
from .permissions import *


class ArticlesViewSet(viewsets.ModelViewSet):
    queryset = Articles.objects.all()
    serializer_class = ArticleSerializer
    permission_classes = (IsUserOrReadOnly,)

    def create(self, request, *args, **kwargs):
        serializer = CreateArticleSerializer(data=request.data, context={'request': self.request})
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


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


class MeAPIRetrieve(generics.RetrieveUpdateAPIView):
    serializer_class = MeSerializer
    permission_classes = (IsAuthenticated,)

    def get_object(self):
        print(self.request.data)
        query = Users.objects.get(username=self.request.user)
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
        sub = UsersSub.objects.filter(user_id=self.kwargs['user'], subscription=self.request.user).values_list(flat=True)

        if bool(sub):
            obj, create = UsersSub.objects.get_or_create(user_id=self.kwargs['user'],
                                                         subscription=self.request.user, )

            return obj

        obj, create = UsersSub.objects.get_or_create(user=self.request.user,
                                                     subscription_id=self.kwargs['user'], )

        return obj


class ActivateJWT(GenericAPIView):
    def get(self, request, uid, token, format=None):
        payload = {'uid': uid, 'token': token}

        url = "http://127.0.0.1:8000/auth/users/activation/"
        response = requests.post(url, data=payload)

        if response.status_code == 204:
            return render(request, 'active/activation.html')
        else:
            return Response(response.json())
# Create your views here.
