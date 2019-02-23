from django.test import TestCase

from django.core.urlresolvers import reverse

from rest_framework import status

from .models import *

from rest_framework.test import APIClient, APITestCase
from rest_framework import status
from rest_framework.response import Response
from users import factories
'''
import os
import io

from PIL import Image
'''

# Create your tests here.
'''
def generate_photo_file():
    file = io.BytesIO()
    image = Image.new('RGBA', size=(100, 100), color=(155, 0, 0))
    image.save(file, 'png')
    file.name = 'test.png'
    file.seek(0)
    return file
'''

class CreateBlogPostTest(APITestCase):
    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)

    def teardown(self):
        BlogPost.objects.all().delete()
        BlogPicture.objects.all().delete()

    def test_create_post(self):
        create_url = reverse('blog:createview',kwargs={'username':self.profile.get_username()})
        #img = generate_photo_file()

        blog_params = {
                'title' : 'test title',
                'body' : 'test body',
        #        'test.png' : img,
                }

        resp = self.client.post(
                create_url,
                data = blog_params,
                )

        self.assertTrue(BlogPost.objects.filter(user__username__iexact = self.profile.user.username).exists())
        #blog = BlogPost.objects.filter(user__username__iexact = self.profile.user.username)
        #self.assertTrue(blog.images.exists())
'''
    def test_create_invalid_user_blog(self):
        profile2 = factories.ProfileFactory()
        client.force_authenticate(user=profile2)
        create_url = reverse('blog:createview',kwargs={'username':profile2.get_username()})

        blog_params = {
                'title' : 'test title',
                'body' : 'test body',
                }

        resp = self.client.post(
                create_url,
                data = blog_params,
                )


        self.assertFalse(BlogPost.objects.filter(user__username__iexact = self.profile.user.username).exists())
'''


