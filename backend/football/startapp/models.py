from django.db import models
from django.contrib.auth.models import AbstractUser


class Users(AbstractUser):
    first_name = models.CharField(max_length=10)
    last_name = models.CharField(max_length=10)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=10, unique=True)
    image = models.ImageField(upload_to='image/users/%Y/%m/%d', null=True)
    bookmarks = models.ManyToManyField('Articles', through='ArticlesRelation', related_name='bookmarks')

    REQUIRED_FIELDS = ['image', 'first_name', 'last_name', 'email', 'bookmarks']

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
    user = models.ForeignKey(Users, on_delete=models.CASCADE, blank=True)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE, blank=True)
    likes = models.BooleanField(default=False)

    REQUIRED_FIELDS = ['article', 'likes']

    def __str__(self):
        return f'user: {self.user} articles: {self.article} likes: {self.likes}'
# Create your models here.
