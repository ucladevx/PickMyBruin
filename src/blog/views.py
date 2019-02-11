from django.shortcuts import render
from rest_framework import generics
from .models import BlogPost, BlogPicture
from django.http import HttpResponse
# Create your views here.

#Create blog

class CreateBlogView(generics.CreateAPIView):

    def post(self, request, username):
        #add check for username and url match, else return 400
        new_blog = BlogPost.objects.create(
                    title=request.data['title'],
                    author=self.request.user,
                    body=request.data['body'],
                )
        for image in request.FILES:
            picture = BlogPicture.objects.create(
                        filename = image.name,
                        blog = new_blog,
                        picture = image
                    )
            picture.save()
        new_blog.save()

        return HttpResponse(status=200)

