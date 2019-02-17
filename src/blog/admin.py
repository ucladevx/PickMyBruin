from django.contrib import admin
from .models import BlogPost,BlogPicture

# Register your models here.
admin.site.register(BlogPost)
admin.site.register(BlogPicture)
