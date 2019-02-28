from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from .models import Data

class DataSerializer(WritableNestedModelSerializer):
	class Meta:
		model = Data
		fields = ('data_type', 'date_created', 'log',)
		read_only_fields = ('data_ type', 'date_created', 'log',)