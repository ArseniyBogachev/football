from django.urls import path, re_path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from .views import *

urlpatterns = [
    path('api/v1/articles/', ArticlesAPIList.as_view(), name='article_list'),
    path('api/v1/articlesrelation/', ArticlesRelationAPIList.as_view(), name='relation_list'),
    path('api/v1/articlescategory/', ArticlesCategoryAPIList.as_view(), name='category_list'),
    path('api/v1/articleslikes/<int:article>/', ArticlesLikesAPIUpdate.as_view(), name='likes_update'),
    path('api/v1/me/', UsersAPIList.as_view(), name='likes_update'),
    re_path(r'^auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.jwt')),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]