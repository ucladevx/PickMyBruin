from django.shortcuts import render, get_object_or_404
from django.conf import settings
from django.db.models import Q
from rest_framework.response import Response
from .models import Request
from .serializers import RequestSerializer
from users.models import Profile, Mentor, User
from .models import Request
from rest_framework import generics

import sendgrid
from sendgrid.helpers.mail import Email, Content, Substitution, Mail

# Create your views here.
class EmailRequestView(generics.CreateAPIView):
    serializer_class = RequestSerializer

    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user)


    def post(self, request, *args, **kwargs):
        
        mentor_id = int(self.kwargs['mentor_id'])
        mentor = get_object_or_404(Mentor, id=mentor_id)
        mentor_email = mentor.profile.user.email

        phone_num = request.data.get('phone', '')
        preferred_mentee_email = request.data.get('preferred_mentee_email', '')
        user_message = request.data.get('message', '')

        mentee_user=self.request.user
        mentee_profile = get_object_or_404(Profile, user=mentee_user)
        mentee_name = mentee_user.first_name + ' ' + mentee_user.last_name
        phone_html = '' if phone_num=='' else ('<b>Phone Number:</b> ' + phone_num)
        email_html = '<b>Email:</b> ' + preferred_mentee_email

        #TODO: Use SendGrid Templates
        content_string = "<html> <p> You have a new request from " + mentee_name + "! Check it out below. If you want to meet with " + mentee_name + """, you should email them back, and the two of you can set up a meeting somewhere on campus.
            If you aren’t able to meet up, it would be helpful if you email them back and let them know, so they can contact other ambassadors.
            If you want an easy way to plan a meeting, consider using services such as <a href='https://doodle.com'>Doodle</a> or <a href='https://www.when2meet.com'>When2Meet</a>.
            We hope you’ll have a good meeting with the student, and thank you for helping out your fellow Bruins!
            <br><br>""" + email_html + "<br>" + phone_html + "<br><br> <b>Message from the User:</b> <br>" + user_message + "</p> </html>"


        from_email =  Email("noreply@bquest.ucladevx.com")
        to_email = Email(mentor_email)
        subject = "New Request from BQuest"
        content = Content("text/html", content_string)
        mail = Mail(from_email, subject, to_email, content)
        sg = sendgrid.SendGridAPIClient(apikey=settings.SENDGRID_API_KEY)
        response = sg.client.mail.send.post(request_body=mail.get())

        new_request = Request(
            mentee=mentee_profile,
            mentor=mentor,
            email_body=user_message,
            preferred_mentee_email=preferred_mentee_email,
            phone=phone_num,
        )

        new_request.save()

        return Response(RequestSerializer(new_request).data)


class ListOwnRequestsView(generics.ListAPIView):
    serializer_class = RequestSerializer

    def get_queryset(self):
        profile = get_object_or_404(Profile, user=self.request.user)

        mentor = Mentor.objects.filter(profile=profile).first()

        query = Q(mentee=profile)

        if (mentor is not None):
            query |= Q(mentor=mentor)

        return Request.objects.filter(query).order_by('date_created').reverse()



