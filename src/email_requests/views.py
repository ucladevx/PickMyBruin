from django.shortcuts import render
from django.core.mail import send_mail
from .models import Request
from .serializers import RequestSerializer

# Create your views here.
class EmailRequestView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = RequestSerializer

    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user)

    def post(self, request, mentor_id):

        subject = ""
        message_body = ""
        from_email = ""
        to_email = ""

        send_mail(subject, message_body, from_email, [to_email], fail_silently=False)


#*****This is all mostly copy paste from view in users^^^


'''What this needs to do is:
	-set up SendGrid
	-Get email of mentor from mentor id in url
	-Get email of mentee from self of who made the request
	-Get email body from api request body
	-Add new request to the table  <-- Look at generics documentation online
	-Send email
	-create tests'''
