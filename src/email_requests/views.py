from django.shortcuts import render

# Create your views here.
class EmailRequestView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = RequestSerializer
    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user)

    def post(self, *args, **kwargs):
          super().post(*args, **kwargs)
          do email shit


#*****This is all mostly copy paste from view in users^^^


'''What this needs to do is:
	-set up SendGrid
	-Get email of mentor from mentor id in url
	-Get email of mentee from self of who made the request
	-Get email body from api request body
	-Add new request to the table  <-- Look at generics documentation online
	-Send email
	-create tests'''

