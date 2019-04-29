#Django Files
from django.contrib.auth.models import User

#DRF files
from rest_framework import serializers

#Source files
from .models import BlogPost, BlogPicture, Comment


class BlogPictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPicture
        fields = ('id','filename','blog', 'picture')


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        likes = serializers.ReadOnlyField(read_only=True,source='getLikes')
        fields = ('id', 'commentuser', 'blog', 'body')
        read_only_fields = ('likes')


class BlogPostSerializer(serializers.ModelSerializer):
    images = BlogPictureSerializer(many=True)
    class Meta:
        model = BlogPost
        fields = ('id','author','user','body','title','images','publish','anonymous','created','published','updated')
        read_only_fields = ('id','anonymous','created','updated')



