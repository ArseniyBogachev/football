import re
from startapp.models import *


class MethodTest:
    def setUp(self):
        self.user_2 = Users.objects.create_user(email='ars@mail.ru', username='subscriber', password='password')
        self.user_2.is_active = True
        self.user_2.save()
        self.cat_1 = CategoryArticles.objects.create(title='test cat', link='test link')
        self.articles_1 = Articles.objects.create(title='test articles 1', author=self.user_1, text='text 1',
                                                  cat=self.cat_1)
        self.articles_2 = Articles.objects.create(title='test articles 2', author=self.user_1, text='text 2',
                                                  cat=self.cat_1)
        self.comment_1 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 1')
        self.comment_2 = CommentArticle.objects.create(user=self.user_1, article=self.articles_1, content='comment 2',
                                                       reply_first=self.comment_1)
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