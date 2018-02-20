from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from users.models import Profile
from .models import Message, Thread
from users.serializers import ProfileSerializer


class ThreadSerializer(WritableNestedModelSerializer):
	profile_1 = ProfileSerializer()
	profile_2 = ProfileSerializer()
	#message = MessageSerializer(serializers.SerializerMethodField('recent_message'))

	def recent_message(self):
		return Message.objects.filter(thread__id=self.id).filter_by('timestamp').first() #or thread=self

	class Meta:
		model = Thread
		fields = ('id', 'profile_1', 'profile_2', )
		read_only_fields = ('id', 'profile_1', 'profile_2', )

class MessageSerializer(WritableNestedModelSerializer):
	thread = ThreadSerializer()
	class Meta:
		model = Message
		fields = ('id', 'thread', 'body', 'timestamp', 'read',)
		read_only_fields = ('id', 'thread', 'body', 'timestamp', 'read',)