from django.shortcuts import render
from rest_framework import generics
from .models import BlogPost, BlogPicture
from django.http import HttpResponse
# Create your views here.

#Create blog

class CreateBlogView(generics.CreateAPIView):

    #Need to add check for duplicate blog titles and content
    def post(self, request, username):
        #add check for username and url match, else return 400
        if(self.request.user.profile.get_username() == username):
            new_blog = BlogPost.objects.create(
                        title=request.data['title'],
                        author=self.request.user,
                        body=request.data['body'],
                    )
            #Cycles through keys in files for multiple image upload
            for data in request.FILES:
                print(data)
                picture = BlogPicture.objects.create(
                            filename = request.FILES[data].name,
                            blog = new_blog,
                            picture = request.FILES[data],
                        )
                picture.save()
            new_blog.save()

            return HttpResponse(status=200)
        else:
            return HttpResponse(status=400)
#View that implements retrieve update and destroy
class RUDBlogView(generics.RetrieveUpdateDestroyAPIView):

    def get(self,request,username):
        return get_object_or_404(BlogPost, id=int(self.kwargs['blog_id']))

#Return all API Views or any number, 10, 20 , 50 random blogs
class BlogView(generics.ListAPIView):



#Need to implement get all blogposts
#Get specific blog view
