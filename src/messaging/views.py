from django.shortcuts import render, get_object_or_404
from django.conf import settings
from django.db.models import Q, Max
from django.http import Http404
from rest_framework.response import Response
from .models import Thread, Message
from .serializers import MessageSerializer, ThreadSerializer
from users.models import Profile, User
from rest_framework import generics
from rest_framework.views import APIView
from pickmybruin.settings import REQUEST_TEMPLATE

import sendgrid
from sendgrid.helpers.mail import Email, Content, Substitution, Mail
import requests

def websockets_notify_user(user):
    # handles both objects and raw id's
    if hasattr(user, 'id'):
        user = user.id

    return requests.post('http://websockets/broadcast/%d' % user)

# Create your views here.

class ReadMessageView(generics.UpdateAPIView):
    """
    View for marking a specified message as read
    """
    serializer_class = MessageSerializer

    def patch(self, request, *args, **kwargs):
        message_id = int(self.kwargs['message_id'])
        message = get_object_or_404(Message, id=message_id)

        message.unread = False

        message.save()

        my_profile = get_object_or_404(Profile, user=self.request.user)
        other_user = message.thread.get_other_user(my_profile)
        websockets_notify_user(other_user)

        return Response(MessageSerializer(message).data)


class CheckHistoryView(APIView):
    """
    View for checking the existence of a thread between two users
    """
    def get(self, request, *args, **kwargs):

        #check if thread exists
        my_profile = get_object_or_404(Profile, user=self.request.user)
        other_id = int(self.kwargs['profile_id'])
        other_profile = get_object_or_404(Profile, id=other_id)

        query = Thread.getProfileQuery(my_profile, other_profile)
        thread = Thread.objects.filter(query).first()

        if thread is None:
            return Response({'exists': False})
        
        return Response({'exists': True})


class SendGetMessagesView(generics.ListCreateAPIView):
    """
    View for both sending a message and retrieving all messages between two users
    """
    serializer_class = MessageSerializer

    def get_queryset(self, *args, **kwargs):
        my_profile = get_object_or_404(Profile, user=self.request.user)
        other_id = int(self.kwargs['profile_id'])
        other_profile = get_object_or_404(Profile, id=other_id)

        #Find associated thread
        
        query = Thread.getProfileQuery(my_profile, other_profile)
        thread = Thread.objects.filter(query).first()

        if thread is None:
            raise Http404("User does not exist")

        messages = Message.objects.filter(thread=thread).order_by('timestamp').reverse()

        return messages

    def post(self, request, *args, **kwargs):
        my_profile = get_object_or_404(Profile, user=self.request.user)
        other_id = int(self.kwargs['profile_id'])
        other_profile = get_object_or_404(Profile, id=other_id)
        message_body = request.data['body']
        
        #Find associated thread, or create new thread
        query = Thread.getProfileQuery(my_profile, other_profile)
        thread = Thread.objects.filter(query).first()
        
        if thread is None:
            new_thread = Thread(
                profile_1=my_profile,
                profile_2=other_profile,
                )

            new_thread.save()
            thread=new_thread
        
        #TODO Send Email
        new_message = Message(
            thread=thread,
            sender=my_profile,
            body=message_body,
            unread=True,
        )

        new_message.save()

        other_user = message.thread.get_other_user(my_profile)
        websockets_notify_user(other_user)

        return Response(MessageSerializer(new_message).data)

class ListOwnThreadsView(generics.ListAPIView):
    serializer_class = ThreadSerializer

    def get_queryset(self):
        my_profile = get_object_or_404(Profile, user=self.request.user)

        #Find all threads that current user is involved in
        query = Thread.getProfileQuery(my_profile)
        
        ret = Thread.objects.filter(
            query,
        ).annotate(
            recent_message_timestamp=Max('message__timestamp'),
        ).order_by(
            '-recent_message_timestamp',
        )

        return ret

