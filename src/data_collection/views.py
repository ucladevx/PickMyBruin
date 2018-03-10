from django.conf import settings
from django.db.models import Q
from rest_framework.response import Response
from .models import Data
from .serializers import DataSerializer
from rest_framework import generics
from . import helpers

# Create your views here.
class DataLogView(generics.CreateAPIView):
	serializer_class = DataSerializer

	def post(self):
		result = helpers.logger(self);
		return result