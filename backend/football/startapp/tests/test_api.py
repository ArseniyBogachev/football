from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from startapp.models import *
from startapp.serializers import *


class ViewTestCase(APITestCase):
    def setUp(self):
        self.user_1 = Users.objects.create_user(email='sen@mail.ru', username='user', password='password')
        self.user_1.is_active = False
        self.user_1.save()
        self.cat_1 = CategoryArticles.objects.create(title='test cat', link='test link')
        self.articles_1 = Articles.objects.create(title='test articles 1', author=self.user_1, text='text 1', cat=self.cat_1)
        self.articles_2 = Articles.objects.create(title='test articles 2', author=self.user_1, text='text 2', cat=self.cat_1)
        self.comment_1 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 1')
        self.comment_2 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 2', reply_first=self.comment_1)

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

    def test_articles_get(self):
        # url = reverse('articles_list')
        url = 'http://127.0.0.1:8000/api/v1/articles/'
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
            'user': 5,
            'article': 9,
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

