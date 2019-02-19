from django.contrib.auth.models import User
from .models import BlogPost, BlogPicture
from rest_framework import serializers

class BlogPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPost
        fields = ('id','author','body','title','publish','created','updated','images')
        read_only_fields = ('id',)


class BlogPictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPicture
        fields = ('filename','blog', 'picture')


