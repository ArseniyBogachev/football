from django.db import models


class Articles(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()


    def __str__(self):
        return self.title
# Create your models here.
