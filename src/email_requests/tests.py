# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.core.urlresolvers import reverse
from rest_framework.test import APIClient, APITestCase

from django.contrib.auth.models import User
from users.models import Profile, Mentor, User
from .models import Request
from users import factories as users_factories
from . import factories
from .serializers import RequestSerializer

# Create your tests here.

class CreateRequestTest(APITestCase):
    
    def setUp(self):
        self.mentee = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.mentee.user)
        self.mentor = users_factories.MentorFactory()

    def tearDown(self):
        Request.objects.all().delete()
        self.mentor.profile.user.delete()
        self.mentee.user.delete()

    def test_make_request(self):
        create_url = reverse('email_requests:send_email', kwargs={'mentor_id': self.mentor.id})
        
        request_params = {
            'preferred_mentee_email': 'test@ucla.edu',
            'message': 'Hi this is test message',
        }

        resp = self.client.post(
            create_url,
            data=request_params,
        )

        self.assertTrue(Request.objects.filter(mentor=self.mentor, mentee=self.mentee).exists())

        request = Request.objects.get(mentor=self.mentor, mentee=self.mentee)

        self.assertEqual(request.mentor, self.mentor)
        self.assertEqual(request.mentee, self.mentee)
        self.assertEqual(request.preferred_mentee_email, request_params['preferred_mentee_email'])

    def test_make_request_no_phone(self):
        create_url = reverse('email_requests:send_email', kwargs={'mentor_id': self.mentor.id})
        
        request_params = {
            'preferred_mentee_email': 'test@ucla.edu',
            'message': 'Hi this is test message',
        }

        resp = self.client.post(
            create_url,
            data=request_params,
        )

        self.assertTrue(Request.objects.filter(mentor=self.mentor, mentee=self.mentee).exists())

        request = Request.objects.get(mentor=self.mentor, mentee=self.mentee)

        self.assertEqual(request.mentor, self.mentor)
        self.assertEqual(request.mentee, self.mentee)
        self.assertEqual(request.phone, '')
        self.assertEqual(request.preferred_mentee_email, request_params['preferred_mentee_email'])

    def test_make_request_unverified(self):
        self.mentee = users_factories.ProfileFactory(verified=False)
        create_url = reverse('email_requests:send_email', kwargs={'mentor_id': self.mentor.id})
        
        request_params = {
            'preferred_mentee_email': 'test@ucla.edu',
            'message': 'Hi this is test message',
        }

        resp = self.client.post(
            create_url,
            data=request_params,
        )

        self.assertFalse(Request.objects.filter(mentor=self.mentor, mentee=self.mentee).exists())

class ListRequestsTest(APITestCase):
    
    get_url = reverse('email_requests:requests_list')

    def setUp(self):
        self.profile = users_factories.ProfileFactory()
        self.mentor = users_factories.MentorFactory(profile=self.profile)
        self.client.force_authenticate(user=self.profile.user)
        

    def tearDown(self):
        self.mentor.profile.user.delete()
        Request.objects.all().delete()

    def test_mentor_only_requests(self):
        
        self.request1 = factories.RequestFactory(mentor=self.mentor)
        self.request2 = factories.RequestFactory(mentor=self.mentor)

        self.request1_json = RequestSerializer(self.request1).data
        self.request2_json = RequestSerializer(self.request2).data

        resp = self.client.get(
            self.get_url,
        )

        self.assertEqual(resp.data['count'], 2)
        self.assertEqual(len(resp.data['results']), 2)

        #order is changed because response is ordered in reverse
        resp_request1 = resp.data['results'][1]
        resp_request2 = resp.data['results'][0]

     
        self.assertEqual(self.request1_json, resp_request1)
        self.assertEqual(self.request1_json, resp_request1)

    def test_mentee_mentor_requests(self):
        
        self.request1 = factories.RequestFactory(mentor=self.mentor)
        self.request2 = factories.RequestFactory(mentee=self.profile)
        self.request3 = factories.RequestFactory(mentor=self.mentor)
        self.request4 = factories.RequestFactory(mentee=self.profile)

        self.request1_json = RequestSerializer(self.request1).data
        self.request2_json = RequestSerializer(self.request2).data
        self.request3_json = RequestSerializer(self.request3).data
        self.request4_json = RequestSerializer(self.request4).data

        resp = self.client.get(
            self.get_url,
        )

        self.assertEqual(resp.data['count'], 4)
        self.assertEqual(len(resp.data['results']), 4)

        #order is changed because response is ordered in reverse
        resp_request1 = resp.data['results'][3]
        resp_request2 = resp.data['results'][2]
        resp_request3 = resp.data['results'][1]
        resp_request4 = resp.data['results'][0]

     
        self.assertEqual(self.request1_json, resp_request1)
        self.assertEqual(self.request2_json, resp_request2)
        self.assertEqual(self.request3_json, resp_request3)
        self.assertEqual(self.request4_json, resp_request4)


    def test_mentee_only_requests(self):
        
        self.request1 = factories.RequestFactory(mentee=self.profile)
        self.request2 = factories.RequestFactory(mentee=self.profile)

        self.request1_json = RequestSerializer(self.request1).data
        self.request2_json = RequestSerializer(self.request2).data
        

        resp = self.client.get(
            self.get_url,
        )

        self.assertEqual(resp.data['count'], 2)
        self.assertEqual(len(resp.data['results']), 2)

        #order is changed because response is ordered in reverse
        resp_request1 = resp.data['results'][1]
        resp_request2 = resp.data['results'][0]

     
        self.assertEqual(self.request1_json, resp_request1)
        self.assertEqual(self.request2_json, resp_request2)


    def test_list_reqests_empty(self):
        resp = self.client.get(
            self.get_url,
        )

        self.assertEqual(resp.data['count'], 0)
        self.assertEqual(len(resp.data['results']), 0)

