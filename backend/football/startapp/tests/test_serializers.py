from rest_framework.test import APITestCase
from startapp.serializers import *
from startapp.utils import MethodTest


class SerializersTestCase(APITestCase, MethodTest):
    def setUp(self):
        self.user_1 = Users.objects.create_user(email='sen@mail.ru', username='user', password='password')
        self.user_1.is_active = True
        self.user_1.save()
        self.user_2 = Users.objects.create_user(email='ars@mail.ru', username='subscriber', password='password')
        self.user_2.is_active = True
        self.user_2.save()
        self.cat_1 = CategoryArticles.objects.create(title='test cat', link='test link')
        self.articles_1 = Articles.objects.create(title='test articles 1', author=self.user_1, text='text 1', cat=self.cat_1)
        self.articles_2 = Articles.objects.create(title='test articles 2', author=self.user_1, text='text 2', cat=self.cat_1)
        self.comment_1 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 1')
        self.comment_2 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 2', reply_first=self.comment_1)
        self.bookmarks_1 = ArticlesRelation.objects.create(user=self.user_1, article=self.articles_2, bookmarks=True)

    def test_me(self):
        data = MeSerializer(self.user_1).data

        expected_data = {
            'image': None,
            'first_name': '',
            'last_name': '',
            'email': 'sen@mail.ru',
            'bookmarks': [6],
            'my_articles': [self.articles_1.pk, self.articles_2.pk],
            'username': 'user',
            'sub_user': [],
            'like_count': 0,
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
            'like_count': 0,
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
            'count_true': 0,
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
