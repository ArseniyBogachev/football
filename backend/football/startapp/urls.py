from django.urls import path
from .views import *

urlpatterns = [
    path('api/v1/articles', ArticlesAPIList.as_view(), name='article_list'),
    path('api/v1/articlesrelation', ArticlesRelationAPIList.as_view(), name='relation_list'),
    path('api/v1/articlescategory', ArticlesCategoryAPIList.as_view(), name='category_list'),
]