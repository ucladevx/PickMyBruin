# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.core.urlresolvers import reverse
from rest_framework.test import APIClient, APITestCase

from django.contrib.auth.models import User
from .models import Profile, Mentor, Major

# Create your tests here.

class CreateUserTest(APITestCase):
    create_url = reverse('users:create')

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_create_user_has_profile_and_user(self):
        user_params = {
            'email': 'test@test.com',
            'password': 'password',
            'first_name': 'first',
            'last_name': 'last',
            'bio': 'sample bio',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )

        user = User.objects.get(email=user_params['email'])
        profile = Profile.objects.get(user=user)

        self.assertEqual(user.email, user_params['email'])
        self.assertEqual(user.first_name, user_params['first_name'])
        self.assertEqual(user.last_name, user_params['last_name'])
        self.assertEqual(profile.bio, user_params['bio'])

    def test_user_username_and_email_equal(self):
        user_params = {
            'email': 'test2@test.com',
            'password': 'password',
            'first_name': 'first',
            'last_name': 'last',
            'bio': 'sample bio',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )

        user = User.objects.get(email=user_params['email'])
        self.assertEqual(user.email, user.username)

class OwnProfileViewTest(APITestCase):
    own_profile_url = reverse('users:me')
    def setUp(self):
        self.user_params = {
            'email': 'test3@test.com',
            'password': 'password',
            'first_name': 'first',
            'last_name': 'last',
            'bio': 'sample bio',
        }

        resp = self.client.post(
            CreateUserTest.create_url,
            data=self.user_params,
        )

        self.profile = Profile.objects.get(user__email=self.user_params['email'])

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_own_profile_returns_own_profile(self):
        self.client.force_authenticate(user=self.profile.user)
        resp = self.client.get(self.own_profile_url)
        self.assertEqual(self.user_params['email'], resp.data['user']['email'])

