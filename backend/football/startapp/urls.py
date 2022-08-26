from django.urls import path, re_path, include
from rest_framework import routers
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from .views import *

router = routers.SimpleRouter()
router.register(r'articles', ArticlesViewSet)


urlpatterns = [
    path('api/v1/', include(router.urls)),
    path('api/v1/articlesrelation/<int:article>/', ArticlesRelationAPIUpdate.as_view(), name='relation_list'),
    path('api/v1/articlescategory/', ArticlesCategoryAPIList.as_view(), name='category_list'),
    path('api/v1/articleslikes/<int:article>/', ArticlesLikesAPIUpdate.as_view(), name='likes_update'),
    path('api/v1/me/', UsersAPIList.as_view(), name='me_list'),
    path('api/v1/user/<str:user>/', UsersSubAPIRetrieve.as_view(), name='user_retrieve'),
    path('api/v1/subscription/<int:user>/', UsersSubAPIUpdate.as_view(), name='subscription_update'),
    re_path(r'^auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.jwt')),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]