
#Django Files
from django.contrib.auth.models import User

#DRF files
from rest_framework import serializers

#Source files
from .models import BlogPost, BlogPicture


class BlogPictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPicture
        fields = ('id','filename','blog', 'picture')



class BlogPostSerializer(serializers.ModelSerializer):
    images = BlogPictureSerializer(many=True)
    class Meta:
        model = BlogPost
        fields = ('id','author','user','body','title','images','publish','created','updated')
        read_only_fields = ('id',)



