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
from django.conf import settings
from django.http import Http404
from django.utils import timezone

#Source Files
from .models import BlogPost, BlogPicture, Comment
from .serializers import *



class CreateBlogView(generics.CreateAPIView):
    serializer_class = BlogPost

    #Need to add check for duplicate blog titles and content
    def post(self, request, username):
        #add check for username and url match, else return 400
        if(self.request.user.profile.get_username() == username):
            new_blog = BlogPost.objects.create(
                        title=request.data['title'],
                        author=self.request.user.first_name + ' ' + request.user.last_name,
                        user = self.request.user,
                        body=request.data['body'],
                        anonymous=request.data['anonymous'],
                        publish=request.data['publish'],
                    )

            if new_blog.publish:
                new_blog.published = timezone.now()

            #Cycles through keys in files for multiple image upload
            for key in request.FILES:
                picture = BlogPicture.objects.create(
                            filename = request.FILES[key].name,
                            blog = new_blog,
                            picture = request.FILES[key],
                        )
                picture.save()
            new_blog.save()


            return Response(BlogPostSerializer(new_blog).data,status=200)
        else:
            return Response(status=400)

#View that implements retrieve update and destroy
class RUDBlogView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = BlogPostSerializer
    queryset = BlogPost.objects.all()

    #Gets specific blog by id
    def get_object(self):
        blog = get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))
        if not blog.publish:
            raise Http404()
        return blog

    def update(self,request,*args,**kwargs):
        blog = get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))
        if(self.request.user == blog.user):
            if 'title' in request.data:
                blog.title=request.data['title']
            if 'body' in request.data:
                blog.body=request.data['body']
            if 'anonymous' in request.data:
                blog.anonymous=request.data['anonymous']
            if 'publish' in request.data:
                blog.publish=request.data['publish']
                blog.published = timezone.now()

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

            return Response(BlogPostSerializer(blog).data)
        else:
            return Response(status=400)

    def delete(self,request, *args, **kwargs):
        blog = get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))
        if(self.request.user == blog.user):
            blogimages = blog.images.all()
            for item in blogimages:
                get_object_or_404(BlogPicture,id=item.id).delete()
            self.queryset.filter(id=self.kwargs['blog_id']).delete()

            return Response(status=200)
        else:
            return Response(status=400)

#Return all Blog Posts or any number, 10, 20 , 50 random blogs
class BlogView(generics.ListAPIView):
    queryset = BlogPost.objects.all()
    serializer_class = BlogPostSerializer

#Filters queryset excluding unpublished posts
    def filter_queryset(self, queryset):

        queryset = queryset.exclude(publish=False)

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

#Check if comment has type=post, type=comment
class CreateCommentView(generics.CreateAPIView):
    serializer_class = CommentSerializer
    queryset = BlogPost.objects.all()

    def post(self, request):
        if(self.request.data['type'] == 'blog'):
            blogpost = self.queryset.get(id=int(self.request.data['id']))

            if(blogpost != None):
                new_comment = Comment.objects.create(
                            user = self.request.user,
                            author=self.request.user.first_name + ' ' + request.user.last_name,
                            blog = blogpost,
                            body = self.request.data['body'],
                        )
                new_comment.save()
                return Response(CommentSerializer(new_comment).data,status=200)
            else:
                return Response(status=400)

        elif(self.request.data['type'] == 'comment'):
            commentpost = Comment.objects.all().get(id=int(self.request.data['id']))

            if(commentpost != None):
                new_comment = Comment.objects.create(
                        user = self.request.user,
                        author=self.request.user.first_name + ' ' + request.user.last_name,
                        comment = commentpost,
                        body = self.request.data['body'],
                    )

                new_comment.save()

                return Response(CommentSerializer(new_comment).data,status=200)
            else:
                return Response(status=400)
        else:
            return Response(status=400)

#Retrieve, update, destroy comment
class RUDCommentView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()

    def get_serializer_context(self):
        context = super(RUDCommentView, self).get_serializer_context()
        if 'depth' in self.request.GET:
            context['depth'] = int(self.request.GET['depth'])
        return context


    def get_object(self):
        comment = get_object_or_404(Comment, id=int(self.kwargs['comment_id']))
        return comment

    def update(self,request,*args,**kwargs):
        comment = get_object_or_404(Comment, id=int(self.kwargs['comment_id']))
        if(self.request.user == comment.user):
            if 'body' in request.data:
                comment.body=request.data['body']
            comment.save()


            return Response(CommentSerializer(comment).data)
        else:
            return Response(status=400)

    def delete(self,request, *args, **kwargs):
        comment = get_object_or_404(Comment, id=int(self.kwargs['comment_id']))
        if(self.request.user == comment.user):
            self.queryset.filter(id=self.kwargs['comment_id']).delete()

            return Response(status=200)
        else:
            return Response(status=400)


#Retrieve a blogs comments
class BlogCommentsView(generics.ListAPIView):
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()

    def get_serializer_context(self):
        context = super(BlogCommentsView, self).get_serializer_context()
        if 'depth' in self.request.GET:
            context['depth'] = int(self.request.GET['depth'])
        return context



    def get_queryset(self):
        blog = get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))
        queryset = blog.commentblog.all()
        if 'num' in self.request.GET:
            num = int(self.request.GET['num'])
            queryset = queryset.all()[:num]
        return queryset

#Increment or decrement likes
class UpdateCommentLikesView(generics.UpdateAPIView):
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()



    def update(self, request, *args, **kwargs):
        comment = get_object_or_404(Comment, id=int(self.kwargs['comment_id']))

        if(comment.likes.filter(id = self.request.user.id).exists()):
            comment.likes.remove(self.request.user)
        else:
            comment.likes.add(self.request.user)


        return Response(CommentSerializer(comment).data, status=200)



