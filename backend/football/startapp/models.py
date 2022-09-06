from django.db import models
from django.contrib.auth.models import AbstractUser


# добавить поле age!!!!!!!!!!!!!!!!!
class Users(AbstractUser):
    first_name = models.CharField(max_length=10)
    last_name = models.CharField(max_length=10)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=10, unique=True)
    image = models.ImageField(upload_to='image/users/%Y/%m/%d', null=True)
    bookmarks = models.ManyToManyField('Articles', through='ArticlesRelation', related_name='bookmarks')
    sub_user = models.ManyToManyField('Users', through='UsersSub', related_name='subscriptions')

    REQUIRED_FIELDS = ['image', 'first_name', 'last_name', 'email', 'bookmarks', 'sub_user', 'id']

    def __str__(self):
        return self.username


class Articles(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()
    cat = models.ForeignKey('CategoryArticles', null=True, on_delete=models.SET_NULL)
    likes = models.ManyToManyField('Users', through='ArticlesLikes', related_name='likes')

    REQUIRED_FIELDS = ['title', 'author', 'date', 'text', 'cat', 'likes']

    def __str__(self):
        return self.title


class ArticlesRelation(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    bookmarks = models.BooleanField(default=False)

    def __str__(self):
        return f'user: {self.user} articles: {self.article} bookmarks: {self.bookmarks}'


class CategoryArticles(models.Model):
    title = models.CharField(max_length=255)
    link = models.CharField(max_length=255)
    image = models.ImageField(upload_to='image/category/%Y/%m/%d')

    def __str__(self):
        return self.title


class ArticlesLikes(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    likes = models.BooleanField(default=False)

    REQUIRED_FIELDS = ['article', 'likes']

    def __str__(self):
        return f'user: {self.user} articles: {self.article} likes: {self.likes}'


class UsersSub(models.Model):
    user = models.ForeignKey(Users, on_delete=models.SET_NULL, null=True, related_name='user')
    subscription = models.ForeignKey(Users, on_delete=models.SET_NULL, null=True, related_name='sub')
    add = models.BooleanField(default=False)


class CommentArticle(models.Model):
    user = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    content = models.TextField()
    reply_first = models.ForeignKey('CommentArticle', null=True, on_delete=models.SET_NULL, related_name='first')
    reply_second = models.ForeignKey('CommentArticle', null=True, on_delete=models.SET_NULL, related_name='second')
    date = models.DateTimeField(auto_now_add=True)
    rate = models.ManyToManyField(Users, through='RateComment', related_name='rate')

    # REQUIRED_FIELDS = ['user', 'article', 'content', 'date', 'rate']

    def __str__(self):
        return f'user: {self.user}'


class RateComment(models.Model):
    user = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    comment = models.ForeignKey(CommentArticle, on_delete=models.CASCADE)
    rate = models.BooleanField(default=False)
# Create your models here.
