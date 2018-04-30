# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.core.urlresolvers import reverse
from rest_framework.test import APIClient, APITestCase

from django.db.models import Q
from django.contrib.auth.models import User
from users.models import Profile
from .models import Message, Thread
from users import factories as users_factories
from .factories import MessageFactory, ThreadFactory
from .serializers import MessageSerializer, ProfileSerializer
import random

class SendMessageTest(APITestCase):

    def setUp(self):
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)
        self.other = users_factories.ProfileFactory()
        

    def tearDown(self):
        Message.objects.all().delete()
        self.me.user.delete()
        self.other.user.delete()

    def test_send_new_thread(self):
        create_url = reverse('messaging:send_get_messages', kwargs={'profile_id': self.other.id})

        message_body = 'Test Message'
        request_params = {
            'body': message_body,
        }

        self.assertEqual(len(Thread.objects.all()), 0)

        resp = self.client.post(
            create_url,
            data=request_params,
            )

        new_thread = Thread.objects.get(Thread.getProfileQuery(self.me, self.other))

        new_message = Message.objects.get(thread=new_thread)

        self.assertEqual(new_message.body, message_body)
        self.assertTrue(new_message.unread)
        self.assertEqual(new_message.sender, self.me)


    def test_send_existing_thread(self):
        self.thread = ThreadFactory(profile_1=self.me, profile_2=self.other)

        create_url = reverse('messaging:send_get_messages', kwargs={'profile_id': self.other.id})

        message_body = 'Test Message'
        request_params = {
            'body': message_body,
        }

        resp = self.client.post(
            create_url,
            data=request_params,
            )

        new_message=Message.objects.get(id=resp.data['id'])

        self.assertEqual(new_message.thread, self.thread)
        self.assertEqual(len(Thread.objects.filter(Thread.getProfileQuery(self.me))), 1)
        self.assertEqual(new_message.body, message_body)
        self.assertTrue(new_message.unread)
        self.assertEqual(new_message.sender, self.me)


class GetThreadTest(APITestCase):

    def setUp(self):
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)
        self.other = users_factories.ProfileFactory()
        self.thread = ThreadFactory(profile_1=self.me, profile_2=self.other)
        self.message1 = MessageFactory(thread=self.thread, sender=self.me)
        self.message2 = MessageFactory(thread=self.thread, sender=self.other)

        self.message1_json = MessageSerializer(message1).data
        self.message2_json = MessageSerializer(message2).data


    def tearDown(self):
        self.thread.delete()
        Message.objects.all().delete()
        self.me.user.delete()
        self.other.user.delete()


    def get_thread(self):
        create_url = reverse('messaging:send_get_messages', kwargs={'profile_id': self.other.id})

        resp = self.client.get(
            create_url,
            )

        self.assertEqual(resp.data['count'], 2)
        self.assertEqual(len(resp.data['results']), 2)

        #order is changed because response is ordered in reverse
        resp_message1 = resp.data['results'][1]
        resp_message2 = resp.data['results'][0]

     
        self.assertEqual(self.message1_json, resp_message2)
        self.assertEqual(self.message2_json, resp_message2)

    def get_thread_user_DNE(self):
        bad_id = self.me.id + self.other.id

        create_url = reverse('messaging:send_get_messages', kwargs={'profile_id': bad_id})

        resp = self.client.get(
            create_url,
            )

        self.assertEqual(resp.status_code, 404)


class MarkReadTest(APITestCase):

    def setUp(self):
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)
        self.thread1 = ThreadFactory(profile_1 = self.me)
        self.thread2 = ThreadFactory(profile_1 = self.me)
        self.message=MessageFactory(thread=self.thread1)
        self.message1=MessageFactory(thread=self.thread2)
        self.message2=MessageFactory(thread=self.thread2)
        self.message3=MessageFactory(thread=self.thread2)

    def tearDown(self):
        Message.objects.all().delete()
        Thread.objects.all().delete()
        self.me.user.delete()

    def test_read_message(self):
        create_url = reverse('messaging:read_thread', kwargs={'thread_id': self.thread1.id})

        self.assertTrue(self.message.unread)

        resp = self.client.patch(
            create_url,
        )

        self.db_message = Message.objects.get(id=self.message.id)
        
        self.assertFalse(self.db_message.unread)

    def test_read_multiple(self):
        create_url = reverse('messaging:read_thread', kwargs={'thread_id': self.thread2.id})

        self.assertTrue(self.message1.unread)
        self.assertTrue(self.message2.unread)
        self.assertTrue(self.message3.unread)

        resp = self.client.patch(
            create_url,
        )

        self.db_message1 = Message.objects.get(id=self.message1.id)
        self.db_message2 = Message.objects.get(id=self.message2.id)
        self.db_message3 = Message.objects.get(id=self.message3.id)
        
        self.assertFalse(self.db_message1.unread)
        self.assertFalse(self.db_message2.unread)
        self.assertFalse(self.db_message3.unread)


class CheckHistoryTest(APITestCase):

    def setUp(self):
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)
        self.other = users_factories.ProfileFactory()
        self.thread = ThreadFactory(profile_1=self.me, profile_2=self.other)

    def tearDown(self):
        self.me.user.delete()
        self.other.user.delete()
        self.thread.delete()

    def test_thread_exists(self):
        create_url = reverse('messaging:check_history', kwargs={'profile_id': self.other.id})

        resp = self.client.get(
            create_url,
        )

        self.assertTrue(resp.data['exists'])

    def test_thread_not_exists(self):
        self.other2 = users_factories.ProfileFactory()

        create_url = reverse('messaging:check_history', kwargs={'profile_id': self.other2.id})

        resp = self.client.get(
            create_url,
        )

        self.assertFalse(resp.data['exists'])

        self.other2.user.delete()


class GetThreadsTest(APITestCase):

    def setUp(self):
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)
        self.other1 = users_factories.ProfileFactory()
        self.other2 = users_factories.ProfileFactory()
        
    def tearDown(self):
        self.me.user.delete()
        self.other1.user.delete()
        self.other2.user.delete()
        Message.objects.all().delete()
        Thread.objects.all().delete()

    def test_no_threads(self):
        create_url = reverse('messaging:thread_list')

        resp = self.client.get(
            create_url,
        )

        self.assertEqual(resp.data['count'], 0)
        self.assertEqual(len(resp.data['results']),0)

    def test_two_threads(self):
        self.thread1 = ThreadFactory(profile_1=self.me, profile_2=self.other1)
        self.thread2 = ThreadFactory(profile_1=self.other2, profile_2=self.me)
        self.message1_t1 = MessageFactory(thread=self.thread1, sender=self.me)
        self.message2_t1 = MessageFactory(thread=self.thread1, sender=self.other1)
        self.message1_t2 = MessageFactory(thread=self.thread2, sender=self.other2)

        self.t1_message_json = MessageSerializer(self.message2_t1).data
        self.t2_message_json = MessageSerializer(self.message1_t2).data

        create_url = reverse('messaging:thread_list')

        resp = self.client.get(
            create_url,
        )

        self.assertEqual(resp.data['count'], 2)
        self.assertEqual(len(resp.data['results']), 2)

        resp_thread_1 = resp.data['results'][1]
        resp_thread_2 = resp.data['results'][0]

        self.assertEqual(resp_thread_1['other_profile'], ProfileSerializer(self.other1).data)
        self.assertEqual(resp_thread_2['other_profile'], ProfileSerializer(self.other2).data)

        self.assertEqual(self.t1_message_json, resp_thread_1['recent_message'])
        self.assertEqual(self.t2_message_json, resp_thread_2['recent_message'])
