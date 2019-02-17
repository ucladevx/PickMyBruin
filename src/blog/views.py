from django.shortcuts import render
from rest_framework import generics
from .models import BlogPost, BlogPicture
from django.http import HttpResponse
# Create your views here.

#Create blog

class CreateBlogView(generics.CreateAPIView):

    def post(self, request, username):
        #add check for username and url match, else return 400
        if(self.request.user.profile.get_username() == username):
            new_blog = BlogPost.objects.create(
                        title=request.data['title'],
                        author=self.request.user,
                        body=request.data['body'],
                    )
            for data in request.FILES:
                picture = BlogPicture.objects.create(
                            filename = data,
                            blog = new_blog,
                            picture = data,
                        )
                picture.save()
            new_blog.save()

            return HttpResponse(status=200)
        else:
            return HttpResponse(status=400)

class RUDBlogView(generics.RetrieveUpdateDestroyAPIView):

    def update(self,request,username):
       if(self.request.user.profile.get_username() == username):
            new_blog = BlogPost.objects.create(
                        title=request.data['title'],
                        author=self.request.user,
                        body=request.data['body'],
                    )
            for data in request.FILES:
                picture = BlogPicture.objects.create(
                            filename = data,
                            blog = new_blog,
                            picture = data,
                        )
                picture.save()
            new_blog.save()

            return HttpResponse(status=200)
        else:
            return HttpResponse(status=400)


