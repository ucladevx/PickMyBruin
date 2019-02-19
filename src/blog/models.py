from django.db import models

from django.utils import timezone
from django.contrib.auth.models import User 

from users.models import Profile

class BlogPost(models.Model):
    title = models.CharField(max_length=250)
    author = models.CharField(max_length=60)
    profile = models.ForeignKey(Profile, related_name='profile',
            on_delete=models.CASCADE, null=True, blank=True)
    body = models.TextField()
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-publish',)

    def __str__(self):
        return self.title# Create your models here.

class BlogPicture(models.Model):
    filename = models.CharField(max_length=250)
    blog = models.ForeignKey(BlogPost, related_name='images')
    picture = models.ImageField(upload_to='blog_pictures/', null=True, blank=True, default='')

    class Meta:
        ordering = ('-filename',)

    def __str__(self):
        return self.filename


