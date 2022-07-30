from django.db import models
from django.contrib.auth.models import AbstractUser


class Users(AbstractUser):
    first_name = models.CharField(max_length=10)
    last_name = models.CharField(max_length=10)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=10, unique=True)
    image = models.ImageField(upload_to='image/users/%Y/%m/%d')
    bookmarks = models.ManyToManyField('Articles', through='ArticlesRelation', related_name='bookmarks')
    likes = models.ManyToManyField('Articles', through='ArticlesLikes', related_name='likes')

    REQUIRED_FIELDS = ['first_name', 'last_name', 'email']

    def __str__(self):
        return self.username


class Articles(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()
    cat = models.ForeignKey('CategoryArticles', null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.title


class ArticlesRelation(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    bookmarks = models.BooleanField(default=False)

    def __str__(self):
        return (self.user, self.article)


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

    def __str__(self):
        return (self.user, self.article)
# Create your models here.
