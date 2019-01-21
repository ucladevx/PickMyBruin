from django.db import models

from django.utils import timezone
from django.contrib.auth.models import User

class BlogPicture(models.Model):
    filename = models.CharField(max_length=250)
    blog = models.ForeignKey(BlogPost)
    picture = models.ImageField(upload_to='blog_pictures/', null=True, blank=True, default='')

    class Meta:
        ordering = ('filename')

    def __str__(self):
        return self.filename

class BlogPost(models.Model):
    title = models.CharField(max_length=250)
    author = models.ForeignKey(User, related_name='blog_posts')
    body = models.TextField()
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-publish',)

    def __str__(self):
        return self.title# Create your models here.
