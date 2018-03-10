from django.conf import settings
from django.db.models import Q
from rest_framework.response import Response
from .models import Data
from .serializers import DataSerializer

#def logger(type='', request):
def logger(self):
	new_data = Data(
			log = self.request.GET['major'],
	)
	new_data.save()
	
	return Response(DataSerializer(new_data).data)