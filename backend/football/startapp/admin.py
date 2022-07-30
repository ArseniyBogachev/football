from django.contrib import admin
from .models import *


class AdminArticles(admin.ModelAdmin):
    list_display = ('id', 'title', 'date', 'text', 'author')


admin.site.register(Articles, AdminArticles)
# Register your models here.
