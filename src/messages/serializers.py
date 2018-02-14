from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from users.models import Profile
from .models import Message, Thread
from users.serializers import ProfileSerializer


class ThreadSerializer(WritableNestedModelSerializer):
	profile_1 = ProfileSerializer()
	profile_2 = ProfileSerializer()
	class Meta:
		model = Thread
		fields = ('profile_1', 'profile_2',)
		read_only_fields = ('profile_1', 'profile_2',)

class MessageSerializer(WritableNestedModelSerializer):
	thread = ThreadSerializer()
	class Meta:
		model = Message
		fields = ('thread', 'body', 'timestamp', 'read',)
		read_only_fields = ('thread', 'body', 'timestamp', 'read',)