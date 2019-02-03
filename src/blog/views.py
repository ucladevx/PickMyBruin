from django.shortcuts import render

# Create your views here.

#Create blog

def CreateBlogView(generics.CreateAPIView):

    def post(self, request):
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

