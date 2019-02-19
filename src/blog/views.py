#Python
from itertools import chain

#Django Rest Framework Files
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser

#Django Files
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.db.models import Q
from django.contrib.postgres.search import TrigramSimilarity
from django.db.models.functions import Greatest


#Source Files
from .models import BlogPost, BlogPicture
from .serializers import *


class CreateBlogView(generics.CreateAPIView):

    #Need to add check for duplicate blog titles and content
    def post(self, request, username):
        #add check for username and url match, else return 400
        if(self.request.user.profile.get_username() == username):
            new_blog = BlogPost.objects.create(
                        title=request.data['title'],
                        author=self.request.user.first_name + ' ' +
                        request.user.last_name,
                        profile = self.request.user.profile,
                        body=request.data['body'],
                    )
            #Cycles through keys in files for multiple image upload
            for key in request.FILES:
                picture = BlogPicture.objects.create(
                            filename = request.FILES[key].name,
                            blog = new_blog,
                            picture = request.FILES[key],
                        )
                picture.save()
            new_blog.save()

            return HttpResponse(status=200)
        else:
            return HttpResponse(status=400)
#View that implements retrieve update and destroy
class RUDBlogView(generics.RetrieveAPIView):
    serializer_class = BlogPostSerializer

    #Gets specific blog by id
    def get_object(self):
        return get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))


#Return all Blog Posts or any number, 10, 20 , 50 random blogs
class BlogView(generics.ListAPIView):
    queryset = BlogPost.objects.all()
    serializer_class = BlogPostSerializer


    def filter_queryset(self, queryset):
        if 'query' in self.request.GET:
            query = self.request.GET['query']
            query = query.split(' ')

            for item in query:
                queryset = queryset.annotate(
                        similarity = Greatest(
                            TrigramSimilarity('title', item),
                            TrigramSimilarity('body', item),
                            )
                        ).filter(similarity__gte=0.10).order_by('-similarity')

        if 'num' in self.request.GET:
            num = int(self.request.GET['num'])
            queryset = queryset.all()[:num]

        return queryset



#Need to implement get all blogposts
#Get specific blog view
