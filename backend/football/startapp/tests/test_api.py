import json

from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from startapp.models import *
from startapp.serializers import ArticleSerializer, ArticlesCategorySerializer, MeSerializer, UserSerializer


class ViewTestCase(APITestCase):
    def setUp(self):
        self.user_1 = Users.objects.create_user(email='sen@mail.ru', username='user', password='password')
        self.user_1.is_active = False
        self.user_1.save()
        self.cat_1 = CategoryArticles.objects.create(title='test cat', link='test link')
        self.articles_1 = Articles.objects.create(title='test articles 1', author=self.user_1, text='text 1', cat=self.cat_1)
        self.articles_2 = Articles.objects.create(title='test articles 2', author=self.user_1, text='text 2', cat=self.cat_1)

    def test_articles_get(self):
        url = reverse('article_list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(ArticleSerializer([self.articles_1, self.articles_2], many=True).data, response.data)

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
            'user': 4,
            'article': 7,
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

        # print(resp)
        # print(MeSerializer(self.user_1).data)
        # print(resp == MeSerializer(self.user_1).data)

        # self.assertEqual(MeSerializer([self.user_1], many=True).data, response.)

    def test_user_retrieve(self):
        url = reverse('user_retrieve', args=(self.user_1.username,))
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)