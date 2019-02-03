from django.contrib.auth.models import User
from .models import BlogPost, BlogPicture
from rest_framework import serializers

class BlogPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPost
        fields = ('author','body','title','publish','created','updated','images')


class BlogPictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPicture
        fields = ('filename','blog', 'picture')


