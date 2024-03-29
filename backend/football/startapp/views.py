import requests
from django.shortcuts import render
from rest_framework import generics, viewsets
from rest_framework.generics import GenericAPIView
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, AllowAny
from rest_framework.response import Response
from .serializers import *
from .permissions import *
from .paginations import *
from django.db.models import Q
from django.utils.datastructures import MultiValueDictKeyError


class ArticlesViewSet(viewsets.ModelViewSet):
    queryset = Articles.objects.all().order_by('id')
    serializer_class = ArticleSerializer
    permission_classes = (IsUserOrReadOnly, TokenIsInvalid)
    pagination_class = ArticlesListPagination

    def create(self, request, *args, **kwargs):
        serializer = CreateArticleSerializer(data=request.data, context={'request': self.request})
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


class ArticleAllApiList(generics.ListAPIView):
    queryset = Articles.objects.all().order_by('id')
    serializer_class = ArticleSerializer
    permission_classes = (IsUserOrReadOnly, TokenIsInvalid)


class ArticlesRelationAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArticlesRelation.objects.all()
    serializer_class = ArticlesRelationSerializer
    permission_classes = (IsAuthenticated, TokenIsInvalid)
    lookup_field = 'article'

    def get_object(self):
        obj, create = ArticlesRelation.objects.get_or_create(user=self.request.user,
                                                             article_id=self.kwargs['article'], )
        return obj


class ArticlesCategoryAPIList(generics.ListAPIView):
    queryset = CategoryArticles.objects.all()
    serializer_class = ArticlesCategorySerializer
    permission_classes = (AllowAny,)


class ArticlesLikesAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArticlesLikes.objects.all()
    serializer_class = ArticlesLikesSerializer
    permission_classes = (IsAuthenticated, TokenIsInvalid)
    lookup_field = 'article'

    def get_object(self):
        obj, create = ArticlesLikes.objects.get_or_create(user=self.request.user,
                                                          article_id=self.kwargs['article'],)
        return obj


class MeAPIRetrieve(generics.RetrieveUpdateAPIView):
    serializer_class = MeSerializer
    permission_classes = (IsCurrentUser, TokenIsInvalid)

    def get_object(self):
        query = Users.objects.get(username=self.request.user)
        return query


class UsersSubAPIRetrieve(generics.RetrieveAPIView):
    serializer_class = UserSerializer
    permission_classes = (AllowAny,)
    lookup_field = 'user'

    def get_object(self):
        query = Users.objects.get(username=self.kwargs['user'])

        return query


class UsersSubAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = UsersSub.objects.all()
    serializer_class = UsersSubSerializer
    permission_classes = (IsAuthenticated, TokenIsInvalid)
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


class CommentArticleAPIList(generics.ListCreateAPIView):
    serializer_class = CommentArticleSerializer
    permission_classes = (IsAuthenticatedOrReadOnly, TokenIsInvalid)

    def get_queryset(self):
        try:
            reply = list(map(int, self.request.query_params['reply'].split(',')))
            if len(reply) == 1:
                query = CommentArticle.objects.filter(article=self.request.query_params['article'],
                                                      reply_first=reply[0])
            else:
                query = CommentArticle.objects.filter(article=self.request.query_params['article'],
                                                      reply_first=reply[0],
                                                      reply_second=reply[1])
        except:
            query = CommentArticle.objects.filter(article=self.request.query_params['article'],
                                                  reply_first=None,
                                                  reply_second=None)
        return query

    def create(self, request, *args, **kwargs):
        try:
            serializer = CreateCommentArticleSerializer(data=request.data, context={
                                                        'request': self.request,
                                                        'article': self.request.query_params['article'][0],
                                                        'reply': list(map(int, self.request.query_params['reply'].split(',')))})
        except MultiValueDictKeyError:
            serializer = CreateCommentArticleSerializer(data=request.data, context={
                                                        'request': self.request,
                                                        'article': self.request.query_params['article']})
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


class RateCommentAPIUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = RateComment.objects.all()
    serializer_class = RateCommentSerializer
    permission_classes = (IsAuthenticated, TokenIsInvalid)
    lookup_field = 'comment'

    def get_object(self):
        obj, create = RateComment.objects.get_or_create(user=self.request.user,
                                                        comment_id=self.kwargs['comment'], )

        return obj



class ActivateJWT(GenericAPIView):
    def get(self, request, uid, token):
        payload = {'uid': uid, 'token': token}
        print(payload)
        url = "http://127.0.0.1:8000/auth/users/activation/"
        response = requests.post(url, data=payload)

        if response.status_code == 204:
            return render(request, 'active/activation.html')
        else:
            return Response(response.json())


class BlackListAddJWT(generics.CreateAPIView):
    queryset = BlackListJWT.objects.all()
    serializer_class = BlackListJWTSerializer


class PlayersViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = (AllowAny,)
    lookup_field = 'player'

    def get_serializer_class(self):
        if self.action == 'list':
            return PlayersLineUpSerializer
        return PlayerSerializerRetrieve

    def get_queryset(self):
        return Players.objects.filter(club__title=self.request.query_params['club'])

    def get_object(self):
        return Players.objects.get(last_name=self.kwargs['player'])


class ClubViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = (AllowAny,)
    serializer_class = ClubSerializerRetrieve
    lookup_field = 'title'

    def list(self, request, *args, **kwargs):
        data = Club.objects.all()
        serializer = ClubSerializerList(data, many=True, context={
            'year': self.request.query_params['year']
        })
        return Response(serializer.data)

    def get_object(self):
        return Club.objects.get(title=self.kwargs['title'])


class MatchesViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = (AllowAny,)

    def get_serializer_class(self):
        if self.action == 'list':
            return MatchesSerializer
        return MatchSerializer

    def get_queryset(self):
        return Matches.objects.filter(Q(home_team__title=self.request.query_params['team']) |
                                      Q(guest_team__title=self.request.query_params['team']))

    def get_object(self):
        return Matches.objects.get(pk=self.kwargs['pk'])


class SearchPlayersAPIList(generics.ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = SearchPlayersListSerializer
    queryset = Players.objects.all()











# class ClubAPIList(generics.ListAPIView):
#     permission_classes = (AllowAny,)
#
#     def get(self, request, *args, **kwargs):
#         data = Club.objects.all()
#         serializer = ClubSerializerList(data, many=True, context={
#             'year': self.request.query_params['year']
#         })
#         return Response(serializer.data)
#
#
# class ClubAPIRetrieve(generics.RetrieveAPIView):
#     queryset = Club.objects.all()
#     serializer_class = ClubSerializerRetrieve
#     permission_classes = (AllowAny,)
#     lookup_field = 'team'
#
#     def get_object(self):
#         return Club.objects.get(title=self.kwargs['team'])
#

# class PlayersLineUpAPIList(generics.ListAPIView):
#     queryset = Players.objects.all()
#     serializer_class = PlayersLineUpSerializer
#     permission_classes = (AllowAny,)
#
#     def get_queryset(self):
#         query = Players.objects.filter(club__title=self.request.query_params['club'])
#         return query
#
#
# class PlayerAPIRetrieve(generics.RetrieveAPIView):
#     queryset = Players.objects.all()
#     serializer_class = PlayerSerializerRetrieve
#     permission_classes = (AllowAny,)
#     lookup_field = 'player'
#
#     def get_object(self):
#         return Players.objects.get(last_name=self.kwargs['player'])