from django.contrib import admin
from .models import *


class AdminArticles(admin.ModelAdmin):
    list_display = ('id', 'title', 'date', 'text', 'author', 'cat')


class AdminUsers(admin.ModelAdmin):
    list_display = ('id', 'username', 'email')


class AdminRelation(admin.ModelAdmin):
    list_display = ('id', 'user', 'article', 'bookmarks')


class AdminCategory(admin.ModelAdmin):
    list_display = ('id', 'title', 'link')


class AdminLikes(admin.ModelAdmin):
    list_display = ('id', 'user', 'article', 'likes')


class AdminSub(admin.ModelAdmin):
    list_display = ('id', 'user', 'subscription', 'add')


class AdminComment(admin.ModelAdmin):
    list_display = ('id', 'user', 'article')


class AdminRate(admin.ModelAdmin):
    list_display = ('id', 'user', 'comment', 'rate')


class AdminBlackListJWT(admin.ModelAdmin):
    list_display = ('id', 'user', 'token')


admin.site.register(Articles, AdminArticles)
admin.site.register(Users, AdminUsers)
admin.site.register(ArticlesRelation, AdminRelation)
admin.site.register(CategoryArticles, AdminCategory)
admin.site.register(ArticlesLikes, AdminLikes)
admin.site.register(UsersSub, AdminSub)
admin.site.register(CommentArticle, AdminComment)
admin.site.register(RateComment, AdminRate)
admin.site.register(BlackListJWT, AdminBlackListJWT)

# Register your models here.
