from django.shortcuts import render, get_object_or_404
from django.core.mail import send_mail
from rest_framework.response import Response
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
    

    def post(self, request, *args, **kwargs):
        print (Request.objects.all())
        mentor = Mentor.objects.all()
        for i in mentor:
            print (i.id)
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


        subject = "New Request from PickMyBruin"
        email_body = "You have a new request from " + mentee_name + "\n" + "Their email is: " + preferred_email + " and their phone number is "+ phone_num + "\nMessage from the user:\n" + user_message 
        from_email = "pickMyBruin@devx.com"
        to_email = mentor_email

        new_request = Request(
            mentee=mentee_profile,
            mentor=mentor,
            email_body=email_body,
            preferred_email=preferred_email,
            phone=phone_num,
        )
        
        new_request.save()
        
        send_mail(subject, email_body, from_email, [to_email], fail_silently=False)

        

        return Response(RequestSerializer(new_request).data)

'''What this needs to do is:
    -set up SendGrid
    -Get email of mentor from mentor id in url
    -Get email of mentee from self of who made the request
    -Get email body from api request body
    -Add new request to the table  <-- Look at generics documentation online
    -Send email
    -create tests'''