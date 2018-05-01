from django.conf import settings
from django.db.models import Q
from rest_framework.response import Response
from .models import Data

def logger(cls, data):
	new_data = Data(data_type=cls, log=data)
	new_data.save()
	return new_data