from django.shortcuts import render, get_object_or_404
from django.conf import settings
from django.db.models import Q, Max
from django.http import Http404
from rest_framework.response import Response
from .models import Thread, Message
from .serializers import MessageSerializer, OwnThreadSerializer
from users.models import Profile, User
from rest_framework import generics
from rest_framework.views import APIView
from pickmybruin.settings import MESSAGING_TEMPLATE

import sendgrid
from sendgrid.helpers.mail import Email, Content, Substitution, Mail

# Create your views here.

class ReadThreadView(generics.UpdateAPIView):
    """
    View for marking a specified thread as read
    """
    serializer_class = OwnThreadSerializer

    def patch(self, request, *args, **kwargs):
        thread_id = int(self.kwargs['thread_id'])
        thread = get_object_or_404(Thread, id=thread_id)
        unread_messages = Message.objects.filter(Q(thread=thread) & Q(unread=True))

        unread_messages.update(unread=False)

        my_profile = get_object_or_404(Profile, user=self.request.user)
        other_user = thread.get_other_user(my_profile)
        return Response(OwnThreadSerializer(thread, context = {'request': self.request}).data)


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

            #Send email to recipient of message
            sender_name = my_profile.user.first_name + ' ' + my_profile.user.last_name
            message_url = 'bquest.ucladevx.com/messages/' + str(other_profile.id) + '/'
            recipient_email = other_profile.user.email
        
            from_email =  Email('noreply@bquest.ucladevx.com')
            to_email = Email(recipient_email)
            subject = 'New Message from BQuest'
            content = Content('text/html', 'N/A')
            mail = Mail(from_email, subject, to_email, content)
            mail.personalizations[0].add_substitution(Substitution('mentee_name', sender_name))
            mail.personalizations[0].add_substitution(Substitution('user_message', message_body))
            mail.personalizations[0].add_substitution(Substitution('user_message_address', message_url))
            mail.template_id = MESSAGING_TEMPLATE
            sg = sendgrid.SendGridAPIClient(apikey=settings.SENDGRID_API_KEY)
            response = sg.client.mail.send.post(request_body=mail.get())
            if not (200 <= response.status_code < 300):
                raise ValidationError({'status_code': response.status_code})

        new_message = Message(
            thread=thread,
            sender=my_profile,
            body=message_body,
            unread=True,
        )

        new_message.save()

        return Response(MessageSerializer(new_message).data)

class ListOwnThreadsView(generics.ListAPIView):
    serializer_class = OwnThreadSerializer

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

    def get_serializer_context(self):
        return {'request': self.request}

