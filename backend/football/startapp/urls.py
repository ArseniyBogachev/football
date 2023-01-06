from django.urls import path, re_path, include
from rest_framework import routers
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from .views import *

router = routers.SimpleRouter()
router.register(r'articles', ArticlesViewSet)
router.register(r'matches', MatchesViewSet, basename='matches')
router.register(r'club', ClubViewSet, basename='club')
router.register(r'players', PlayersViewSet, basename='players')


urlpatterns = [
    path('api/v1/', include(router.urls)),
    path('api/v1/articlesrelation/<int:article>/', ArticlesRelationAPIUpdate.as_view(), name='relation_list'),
    path('api/v1/articlescategory/', ArticlesCategoryAPIList.as_view(), name='category_list'),
    path('api/v1/articleslikes/<int:article>/', ArticlesLikesAPIUpdate.as_view(), name='likes_update'),
    path('api/v1/me/', MeAPIRetrieve.as_view(), name='me_list'),
    path('api/v1/user/<str:user>/', UsersSubAPIRetrieve.as_view(), name='user_retrieve'),
    path('api/v1/subscription/<int:user>/', UsersSubAPIUpdate.as_view(), name='subscription_update'),
    path('api/v1/comment/', CommentArticleAPIList.as_view(), name='comment_list_post'),
    path('api/v1/rate/<int:comment>/', RateCommentAPIUpdate.as_view(), name='comment_rate_update'),
    path('api/v1/blacklist/', BlackListAddJWT.as_view(), name='black_list'),
    path('api/v1/players-all/', SearchPlayersAPIList.as_view(), name='players-all_list'),
    path('api/v1/article-all/', ArticleAllApiList.as_view(), name='article-all_list'),
    re_path(r'^auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.jwt')),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    re_path(r'activate/(?P<uid>[\w-]+)/(?P<token>[\w-]+)/$', ActivateJWT.as_view(), name='activation'),
]