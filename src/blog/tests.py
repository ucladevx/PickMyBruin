
#Django Files
from django.test import TestCase
from django.shortcuts import get_object_or_404
from django.core.urlresolvers import reverse

#DRF Files
from rest_framework import status
from rest_framework.test import APIClient, APITestCase
from rest_framework import status
from rest_framework.response import Response

#Source Files
from users import factories
from . import factories as blogfactory
from .models import *

#System Files
import os
import io

#Third Party Files
from PIL import Image

# Create your tests here.
#Creates random photo for image upload
def generate_photo_file():
    file = io.BytesIO()
    image = Image.new('RGBA', size=(100, 100), color=(155, 0, 0))
    image.save(file, 'png')
    file.name = 'test.png'
    file.seek(0)
    return file

#Test for create, patch, and delete
class CUDBlogPostTest(APITestCase):
    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)

    def tearDown(self):
        BlogPost.objects.all().delete()
        BlogPicture.objects.all().delete()

    def test_create_update_destroy_post(self):
        create_url = reverse('blog:createview',kwargs={'username':self.profile.get_username()})
        img = generate_photo_file()

        blog_params = {
                'title' : 'test title',
                'body' : 'test body',
                'test.png' : img,
                'anonymous' : False,
                'published' : True,
                }

        resp = self.client.post(
                create_url,
                data = blog_params,
                )

        self.assertTrue(BlogPost.objects.filter(user__username__iexact = self.profile.user.username).exists())
        blog = BlogPost.objects.get(user__username__iexact = self.profile.user.username)
        self.assertTrue(blog.images.all().exists())
        for item in blog.images.all():
            get_object_or_404(BlogPicture,id=item.id).delete()

        update_url = reverse('blog:RUD', kwargs={'blog_id':blog.id})
        blog_params = {
                'title' : 'updated title',
                'body' : 'updated body',
                'anonymous' : False,
                'published' : True,
                }
        resp = self.client.patch(
                update_url,
                data = blog_params,
                )
        self.assertTrue(resp.data['title'] == blog_params['title'])

        resp = self.client.delete(
                update_url,
                )

        self.assertTrue(resp.status_code == 200)

    def test_create_invalid_user_blog(self):
        profile2 = factories.ProfileFactory()
        create_url = reverse('blog:createview',kwargs={'username':profile2.get_username()})

        blog_params = {
                'title' : 'test title',
                'body' : 'test body',
                'anonymous' : False
                }

        resp = self.client.post(
                create_url,
                data = blog_params,
                )


        self.assertFalse(BlogPost.objects.filter(user__username__iexact = self.profile.user.username).exists())

#Tests for retrieving single blog post
class RetrieveBlogPostTest(APITestCase):

    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)
        self.blog = blogfactory.BlogFactory()
        self.ablog = blogfactory.AnonymousBlogFactory()

    def tearDown(self):
        Profile.objects.all().delete()
        BlogPost.objects.all().delete()
        BlogPicture.objects.all().delete()

    def test_get_post(self):
        create_url = reverse('blog:RUD', kwargs={'blog_id':self.blog.id})

        resp = self.client.get(
                create_url
                )

        self.assertTrue(resp.status_code==200)

    def test_invalid_post(self):
        post2 = blogfactory.BlogFactory()
        create_url = reverse('blog:RUD', kwargs={'blog_id':999999})

        resp = self.client.get(
                create_url
                )

        self.assertFalse(resp.status_code==200)

    def test_anonymous_post(self):
        create_url = reverse('blog:RUD', kwargs={'blog_id':self.ablog.id})
        resp = self.client.get(
                create_url
                )

        self.assertTrue(resp.data['anonymous'])

    def test_unpublished_post(self):
        create_url = reverse('blog:RUD', kwargs={'blog_id':self.blog.id})
        self.blog.published = False
        self.blog.save()
        resp = self.client.get(
                create_url
                )

        self.assertTrue(resp.status_code==404)

#Test for query name and number
class QueryBlogsTest(APITestCase):
    get_url = reverse('blog:blogs')

    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)
        self.blog = blogfactory.BlogFactory()
        self.blog1 = blogfactory.BlogFactory()
        self.blog2 = blogfactory.BlogFactory()
        self.blog2.published = False
        self.blog2.save()
        self.blog.title = 'TestQueryTitle'
        self.blog.save()

    def tearDown(self):
        Profile.objects.all().delete()
        BlogPost.objects.all().delete()

    def test_get_all_posts(self):

        resp = self.client.get(
                self.get_url
                )
        print(resp.data['count'])

        self.assertTrue(resp.data['count'] == 2)

    def test_get_single_post(self):

        resp = self.client.get(
                self.get_url,
                data={
                    'num' : 1,
                    },
                )

        self.assertTrue(resp.data['count'] == 1)

    def test_get_title_post(self):

        resp = self.client.get(
                self.get_url,
                data={
                    'query': 'Test',
                    },
                )
        self.assertTrue(resp.data['results'][0]['title'] == self.blog.title)


