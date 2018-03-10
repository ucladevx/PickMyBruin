from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from .models import Data

class DataSerializer(WritableNestedModelSerializer):
    class Meta:
        model = Data
        fields = ('ID', 'date_created', 'log',)
        read_only_fields = ('ID', 'date_created', 'log',)