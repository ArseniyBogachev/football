from django.urls import reverse
import datetime
import re
from rest_framework import status
from rest_framework.test import APITestCase
from startapp.models import *
from startapp.serializers import *


class ViewTestCase(APITestCase):
    def setUp(self):
        self.user_1 = Users.objects.create_user(email='sen@mail.ru', username='user', password='password')
        self.user_1.is_active = False
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

    @staticmethod
    def list_queryset(data, list_=None):
        if isinstance(list_, list):
            for i in data:
                if i in list_:
                    data[i] = list(data[i])
        else:
            for i in data:
                for j in i:
                    if j == list_:
                        i[j] = list(i[j])

        return data

    @staticmethod
    def compare_date(response, result):
        match_result = re.findall(r'[0-9:-]{7,}[^. ]?', result['date'])
        match_response = re.findall(r'[0-9:-]{7,}[^.T]?', response['date'])
        if match_result == match_response:
            return {'result': match_result, 'response': match_response}

        return {'result': result['date'], 'response': response['date']}

    def test_articles_get(self):
        url = reverse('articles-list')
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = self.list_queryset(response.data, 'comment')
        serializer = self.list_queryset(ArticleSerializer([self.articles_1, self.articles_2], many=True).data, 'comment')

        self.assertEqual(serializer, data)


    def test_category_get(self):
        url = reverse('category_list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(ArticlesCategorySerializer([self.cat_1], many=True).data, response.data)


    def test_jwt_post(self):
        url = reverse('token_obtain_pair')
        response = self.client.post(url, {'username': 'user', 'password': 'password'}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        self.user_1.is_active = True
        self.user_1.save()
        response = self.client.post(url, {'username': 'user', 'password': 'password'}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        return response.data

    def test_likes_update(self):
        url = reverse('likes_update', args=(self.articles_1.id,))

        data = {
            'likes': True,
        }

        result = {
            'id': 1,
            'likes': True,
            'user': self.user_1.pk,
            'article': self.articles_1.pk,
        }

        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)
        response = self.client.patch(url, data=data)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, result)

    def test_me_list(self):
        url = reverse('me_list')
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        serializer = self.list_queryset(MeSerializer(self.user_1).data, ['sub_user', 'bookmarks', 'my_articles'])
        data = self.list_queryset(response.data, ['sub_user', 'bookmarks', 'my_articles'])

        self.assertEqual(serializer, data)

    def test_user_retrieve(self):
        url = reverse('user_retrieve', args=(self.user_1.username,))
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        serializer = self.list_queryset(UserSerializer(self.user_1).data, ['sub_user', 'my_articles'])
        data = self.list_queryset(response.data, ['sub_user', 'my_articles'])

        self.assertEqual(serializer, data)

    def test_comment_list(self):
        url = reverse('comment_list_post')
        response = self.client.get(url, {'article': self.articles_1.id})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(CommentArticleSerializer([self.comment_1], many=True).data, response.data)

    def test_reply_list(self):
        url = reverse('comment_list_post')
        response = self.client.get(url, {'article': self.articles_1.id, 'reply': self.comment_1.id})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(CommentArticleSerializer([self.comment_2], many=True).data, response.data)

    def test_article_post(self):
        url = reverse('articles-list')
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'title': 'title',
            'text': 'text',
            'cat': self.cat_1.pk
        }

        response = self.client.post(url, data)

        result = {
            'title': 'title',
            'text': 'text',
            'date': str(datetime.datetime.now(datetime.timezone.utc)),
            'cat': 1
        }

        date = self.compare_date(response.data, result)
        response.data['date'] = date['response']
        result['date'] = date['result']

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

    def test_article_update(self):
        url = reverse('articles-detail', args=(self.articles_1.pk,))
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'title': 'test articles 1',
            'author': self.user_1,
            'text': 'text update 1',
            'cat': self.cat_1.pk
        }

        response = self.client.put(url, data)
        self.articles_1.refresh_from_db()
        result = ArticleSerializer(self.articles_1).data
        response.data = self.list_queryset(response.data, ['comment'])
        result = self.list_queryset(result, ['comment'])

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

    def test_bookmarks_update(self):
        url_patch = reverse('relation_list', args=(self.articles_1.pk,))
        url_delete = reverse('relation_list', args=(self.articles_2.pk,))
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'bookmarks': True,
        }

        result = {
            'id': 5,
            'bookmarks': True,
            'user': self.user_1.pk,
            'article': self.articles_1.pk
        }

        response = self.client.patch(url_patch, data)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

        queryset = ArticlesRelation.objects.all()
        self.assertEqual(2, len(queryset))

        response = self.client.delete(url_delete)

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        queryset = ArticlesRelation.objects.all()
        self.assertEqual(1, len(queryset))
        self.assertEqual(self.articles_1, queryset[0].article)

    def test_subscribers_update(self):
        url_subscribe = reverse('subscription_update', args=(self.user_2.pk,))
        url_accept_delete = reverse('subscription_update', args=(self.user_1.pk,))
        url_auth = reverse('token_obtain_pair')
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'add': False,
        }

        result = {
            'id': 1,
            'add': False,
            'user': self.user_1.pk,
            'subscription': self.user_2.pk,
        }

        response = self.client.patch(url_subscribe, data)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

        data = {
            'add': True,
        }

        result = {
            'id': 1,
            'add': True,
            'user': self.user_1.pk,
            'subscription': self.user_2.pk,
        }

        auth = self.client.post(url_auth, {'username': 'subscriber', 'password': 'password'}, format='json')
        token = auth.data['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        response = self.client.patch(url_accept_delete, data)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

        queryset = UsersSub.objects.all()
        self.assertEqual(1, len(queryset))

        response = self.client.delete(url_accept_delete)

        queryset = UsersSub.objects.all()
        self.assertEqual(0, len(queryset))

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

    def test_comment_create(self):
        url = f'http://127.0.0.1:8000/api/v1/comment/?article={self.articles_1.id}'
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'content': 'text1...'
        }

        result = {
            'content': 'text1...',
            'date': str(datetime.datetime.now(datetime.timezone.utc)),
            'rate': [],
            'reply_first': None,
            'reply_second': None
        }

        response = self.client.post(url, data)
        date = self.compare_date(response.data, result)
        response.data['date'] = date['response']
        result['date'] = date['result']

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)

    def test_reply_create(self):
        url = f'http://127.0.0.1:8000/api/v1/comment/?article={self.articles_1.id}&reply={self.comment_1.id}'
        token = self.test_jwt_post()['access']
        self.client.credentials(HTTP_AUTHORIZATION='Bearer ' + token)

        data = {
            'content': 'text2...'
        }

        result = {
            'content': 'text2...',
            'date': str(datetime.datetime.now(datetime.timezone.utc)),
            'rate': [],
            'reply_first': self.comment_1.id,
            'reply_second': None
        }

        response = self.client.post(url, data=data)
        date = self.compare_date(response.data, result)
        response.data['date'] = date['response']
        result['date'] = date['result']

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(result, response.data)