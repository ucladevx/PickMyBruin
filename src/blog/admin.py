from django.contrib import admin
from .models import BlogPost,BlogPicture,Comment

# Register your models here.
admin.site.register(BlogPost)
admin.site.register(BlogPicture)
admin.site.register(Comment)
