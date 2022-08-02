from django.urls import reverse
from rest_framework.test import APITestCase
from startapp.models import *
from startapp.serializers import ArticleSerializer


class ArticlesTestCase(APITestCase):
    def test_get(self):
        user_1 = Users.objects.create(first_name='arseniy', last_name='bog', email='sen@mail.ru', username='kuwsh1n')
        cat_1 = CategoryArticles.objects.create(title='test cat', link='test link')
        articles_1 = Articles.objects.create(title='test articles 1', author=user_1, text='text 1', cat=cat_1)
        articles_2 = Articles.objects.create(title='test articles 2', author=user_1, text='text 2', cat=cat_1)
        url = reverse('article_list')
        response = self.client.get(url)
        self.assertEqual(ArticleSerializer([articles_1, articles_2], many=True).data, response.data)
