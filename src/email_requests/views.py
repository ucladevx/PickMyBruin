from django.shortcuts import render, get_object_or_404
from django.conf import settings
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
        print (Request.objects.all())
        mentor = Mentor.objects.all()
        mentors = Mentor.objects.all()
        mentor_id = int(self.kwargs['mentor_id'])
        mentor = get_object_or_404(Mentor, id=mentor_id)
        mentor_email = mentor.profile.user.email

        phone_num = request.data["phone"]
        preferred_email = request.data["preferred_email"]
        user_message = request.data["message"]

        mentee_user=self.request.user
        print(mentee_user)
        mentee_profile = get_object_or_404(Profile, user=mentee_user)
        mentee_name = mentee_user.first_name + ' ' + mentee_user.last_name

        content_string = '\n\n'.join([
            "You have a new request from " + mentee_name,
            "Their email is: " + preferred_email + " and their phone number is "+ phone_num,
            "Message from the user:",
            user_message,
        ])

        from_email =  Email("pickMyBruin@devx.com")
        to_email = Email(mentor_email)
        subject = "New Request from PickMyBruin"
        content = Content("text/html", content_string)
        mail = Mail(from_email, subject, to_email, content)
        sg = sendgrid.SendGridAPIClient(apikey=settings.SENDGRID_API_KEY)
        response = sg.client.mail.send.post(request_body=mail.get())

        new_request = Request(
            mentee=mentee_profile,
            mentor=mentor,
            email_body=content_string,
            preferred_email=preferred_email,
            phone=phone_num,
        )

        new_request.save()

        return Response(RequestSerializer(new_request).data)
