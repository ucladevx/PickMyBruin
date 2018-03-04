# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.core.urlresolvers import reverse
from rest_framework.test import APIClient, APITestCase

from django.contrib.auth.models import User
from users.models import Profile
from .models import Message, Thread
from users import factories as users_factories
from .factories import MessageFactory, ThreadFactory
from .serializers import MessageSerializer, ThreadSerializer

# Create your tests here.



#Send message with new thread
#send message with existing thread (ensure doesnt make a new thread)

#get all messages between two people, check order

#mark message as read

#check existence of thread, when it exists and doesnt

#get all threads, ensure correct ordering
#ensure correct most recent message?

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

        new_thread = Thread.objects.get(profile_1=self.me, profile_2=self.other)

        new_message = Message.objects.get(thread=new_thread)

        self.assertEqual(new_message.body, message_body)
        self.assertTrue(new_message.unread)
        self.assertEqual(new_message.thread, new_thread)
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
        self.assertEqual(len(Thread.objects.all()), 1)
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


class MarkReadTest(APITestCase):

    def setUp(self):
        self.message=MessageFactory()
        self.me = users_factories.ProfileFactory()
        self.client.force_authenticate(user=self.me.user)

    def tearDown(self):
        self.message.delete()
        self.me.user.delete()

    def test_read_message(self):
        create_url = reverse('messaging:read_message', kwargs={'message_id': self.message.id})

        self.assertTrue(self.message.unread)

        request_params = {
        'null': 'null',
        }

        resp = self.client.patch(
            create_url,
            data=request_params,
        )

        self.message = Message.objects.get(id=self.message.id)
        
        self.assertFalse(self.message.unread)


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

        self.assertEqual(resp.data['exists'], 'True')

    def test_thread_not_exists(self):
        self.other2 = users_factories.ProfileFactory()

        create_url = reverse('messaging:check_history', kwargs={'profile_id': self.other2.id})

        resp = self.client.get(
            create_url,
        )

        self.assertEqual(resp.data['exists'], 'False')

        self.other2.user.delete()
