from django.contrib.auth.models import User
from .models import BlogPost, BlogPicture
from rest_framework import serializers



class BlogPictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPicture
        fields = ('filename','blog', 'picture')



class BlogPostSerializer(serializers.ModelSerializer):
    images = BlogPictureSerializer(many=True)
    class Meta:
        model = BlogPost
        fields = ('id','author','profile','body','title','images','publish','created','updated')
        read_only_fields = ('id',)



