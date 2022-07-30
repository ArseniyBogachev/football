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

# Create your views here.
