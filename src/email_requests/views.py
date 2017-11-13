from django.shortcuts import render, get_object_or_404
from django.core.mail import send_mail
from .models import Request
from .serializers import RequestSerializer
from users.models import Profile, Mentor, User
from .models import Request
from rest_framework import generics


# Create your views here.
class EmailRequestView(generics.CreateAPIView):
    serializer_class = RequestSerializer

    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user) 
'''
    def post(self, *args, **kwargs):

        mentor_id = int(self.kwargs['mentor_id'])
        mentor = get_object_or_404(User, id=mentor_id)
        mentor_email = mentor.email

        mentee_id = self.request.user.user.id
        mentee = get_object_or_404(User, id=mentee_id)
        mentee_name = mentee.first_name + ' ' + mentee.last_name
        mentee_email = mentee.email


        subject = "New Request from PickMyBruin"
        message_body = "You have a new request from " + mentee_name + "\n" + "Their email is: " + mentee.email "\n"
        from_email = "pickMyBruin@devx.com"
        to_email = mentor_email

        send_mail(subject, message_body, from_email, [to_email], fail_silently=False)

        add request to database (similiar to adding a new user(look at views.py for users))
            return Response(RequestSerializer(new_request).data)
        

        return "request saved to database"


'''

    def post(self, request, *args, **kwargs):

        print (self.kwargs)
        mentor_id = int(self.kwargs['mentor_id'])
        mentor = get_object_or_404(User, id=mentor_id)
        mentor_email = mentor.email

        phone_num = request.data["phone"]
        preferred_email = request.data["preferred_email"]
        user_message = request.data["message"]


        mentee_id = self.request.user.user.id
        mentee = get_object_or_404(User, id=mentee_id)
        mentee_name = mentee.first_name + ' ' + mentee.last_name

        email_body = user_message + "More we will add"

        new_request = Request(
            mentee=mentee,
            mentor=mentor,
            email_body=email_body,
            preferred_email=preferred_email,
            phone=phone_num,

        )
        new_request.save()
        return Response(RequestSerializer(new_request).data)


    
'''
        API:
        {
        "phone": "<OPTIONAL_PHONE>"
        "preferred_email": "<REPLY_EMAIL>"
        "message": "<EMAIL_BODY>"
    }

'''


'''What this needs to do is:
    -set up SendGrid
    -Get email of mentor from mentor id in url
    -Get email of mentee from self of who made the request
    -Get email body from api request body
    -Add new request to the table  <-- Look at generics documentation online
    -Send email
    -create tests'''
