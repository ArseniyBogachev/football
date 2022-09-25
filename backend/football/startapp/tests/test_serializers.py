from django.urls import reverse
from rest_framework.test import APITestCase
from startapp.serializers import *
from startapp.utils import MethodTest


class SerializersTestCase(MethodTest, APITestCase):
    def setUp(self):
        self.user_1 = Users.objects.create_user(email='sen@mail.ru', username='user', password='password')
        self.user_1.is_active = True
        self.user_1.save()
        super().setUp()
        self.like_1 = ArticlesLikes.objects.create(user=self.user_1, article=self.articles_1, likes=True)
        self.subscriber_1 = UsersSub.objects.create(user=self.user_1, subscription=self.user_2, add=False)
        self.rate_1 = RateComment.objects.create(user=self.user_1, comment=self.comment_2, rate=True)

    def test_me(self):
        data = MeSerializer(self.user_1).data

        expected_data = {
            'image': None,
            'first_name': '',
            'last_name': '',
            'email': 'sen@mail.ru',
            'bookmarks': [51],
            'my_articles': [self.articles_1.pk, self.articles_2.pk],
            'username': 'user',
            'sub_user': [],
            'like_count': 1,
            'followers_count': 0
        }

        data = self.list_queryset(data, ['my_articles', 'sub_user', 'bookmarks'])

        self.assertEqual(data, expected_data)

    def test_user(self):
        data = UserSerializer(self.user_1).data

        expected_data = {
            'image': None,
            'first_name': '',
            'last_name': '',
            'my_articles': [self.articles_1.pk, self.articles_2.pk],
            'username': 'user',
            'sub_user': [],
            'subscriber_user': False,
            'id': self.user_1.pk,
            'choice_user': False,
            'like_count': 1,
            'followers_count': 0
        }

        data = self.list_queryset(data, ['my_articles', 'sub_user'])

        self.assertEqual(data, expected_data)

    def test_article(self):
        data = ArticleSerializer(self.articles_1).data

        expected_data = {
            'title': 'test articles 1',
            'text': 'text 1',
            'date': '0 second ago',
            'cat': self.cat_1.pk,
            'like_dislike': {'like': 0, 'dislike': 0},
            'count_true': 1,
            'count_false': 0,
            'author': 'user',
            'id': self.articles_1.pk,
            'comment': [self.comment_1.pk, self.comment_2.pk]
        }

        data = self.list_queryset(data, ['comment'])

        self.assertEqual(data, expected_data)

    def test_create_article(self):
        data = CreateArticleSerializer(self.articles_1).data

        expected_data = {
            'title': 'test articles 1',
            'text': 'text 1',
            'date': str(datetime.datetime.now(datetime.timezone.utc)),
            'cat': self.cat_1.pk
        }

        compare = self.compare_date(data, expected_data)

        data['date'] = compare['response']
        expected_data['date'] = compare['result']

        self.assertEqual(data, expected_data)

    def test_relation(self):
        data = ArticlesRelationSerializer(self.bookmarks_1).data

        expected_data = {
            'id': 28,
            'bookmarks': True,
            'user': self.user_1.pk,
            'article': self.articles_2.pk
        }

        self.assertEqual(data, expected_data)

    def test_category(self):
        data = ArticlesCategorySerializer(self.cat_1).data

        expected_data = {
            'id': 20,
            'title': 'test cat',
            'link': 'test link',
            'image': None
        }

        self.assertEqual(data, expected_data)

    def test_likes(self):
        data = ArticlesLikesSerializer(self.like_1).data

        expected_data = {
            'id': 8,
            'likes': True,
            'user': self.user_1.pk,
            'article': self.articles_1.pk
        }

        self.assertEqual(data, expected_data)

    def test_subscriber(self):
        data = UsersSubSerializer(self.subscriber_1).data

        expected_data = {
            'id': 12,
            'add': False,
            'user': self.user_1.pk,
            'subscription': self.user_2.pk
        }

        self.assertEqual(data, expected_data)

    def test_comment(self):
        data = CommentArticleSerializer(self.comment_1).data

        expected_data = {
            'user': 'user',
            'content': 'comment 1',
            'date': '0 second ago',
            'id': 43,
            'rate_user': False,
            'rate_count': 0,
            'reply_first': None,
            'reply_second': None
        }

        self.assertEqual(data, expected_data)

    def test_comment_create(self):
        data = CreateCommentArticleSerializer(self.comment_1).data

        expected_data = {
            'content': 'comment 1',
            'date': str(datetime.datetime.now(datetime.timezone.utc)),
            'rate': [],
            'reply_first': None,
            'reply_second': None
        }

        compare = self.compare_date(data, expected_data)
        data['date'] = compare['response']
        expected_data['date'] = compare['result']

        self.assertEqual(data, expected_data)

    def test_rate(self):
        data = RateCommentSerializer(self.rate_1).data

        expected_data = {
            'id': 11,
            'rate': True,
            'user': self.user_1.pk,
            'comment': self.comment_2.pk
        }

        self.assertEqual(data, expected_data)

    def test_blacklistJWT(self):
        url = reverse('token_obtain_pair')
        response = self.client.post(url, {'username': 'user', 'password': 'password'})
        self.black_list_1 = BlackListJWT.objects.create(token=response.data['access'], user=self.user_1)

        data = BlackListJWTSerializer(self.black_list_1).data
        expected_data = {
            'id': 2,
            'token': response.data['access']
        }

        self.assertEqual(data, expected_data)
