#Python
from itertools import chain
import re

#Django Rest Framework Files
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser
from rest_framework.response import Response

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
                        user = self.request.user,
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
class RUDBlogView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = BlogPostSerializer

    #Gets specific blog by id
    def get_object(self):
        return get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))

    def update(self,request,*args,**kwargs):
        blog = get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))
        if(self.request.user == blog.user):
            if 'tile' in request.data:
                blog.title=request.data['title']
            if 'body' in request.data:
                blog.body=request.data['body']

            imageset = blog.images.all()

            #Check array against image set
            #Compare two arrays and find entries that are missing
            if 'images' in request.data:
                #Cycle through current blogimages
                for blogimage in imageset:
                    #Check if image is in array
                    if blogimage.id not in request.data['images']:
                        imageset.filter(id=blogimage.id).delete()
            for key in request.FILES:
                picture = BlogPicture.objects.create(
                            filename = request.FILES[key].name,
                            blog = blog,
                            picture = request.FILES[key],
                        )
                picture.save()
            blog.save()
            #Cycles through keys in files for multiple image upload
            '''
            regex = r"\[im[^\]]*\](.*?)\[/im\]"
            print('WORKING WORKING')
            for match in re.finditer(regex, request.data['body']):
                print(match)
            '''

            return Response(BlogPostSerializer(blog).data)
        else:
            return HttpResponse(status=400)
#

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
