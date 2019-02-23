from django.test import TestCase

from django.core.urlresolvers import reverse

from rest_framework import status

from .models import *

from rest_framework.test import APIClient, APITestCase

from users import factories


# Create your tests here.

class CreateBlogPostTest(APITestCase):
    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)

    def teardown(self):
        BlogPost.objects.all().delete()
        BlogPicture.objects.all().delete()

    def test_create_post(self):
        create_url = reverse('blog:createview',kwargs={'username':self.profile.get_username()})

        blog_params = {
                'title' : 'test title',
                'body' : 'test body',
                }

        resp = self.client.post(
                create_url,
                data = blog_params,
                )

        self.assertTrue(BlogPost.objects.filter(user__username__iexact = self.profile.user.username).exists())

    def test create_invalid_user_blog(self):
        
