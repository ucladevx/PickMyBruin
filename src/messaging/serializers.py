from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from users.models import Profile
from .models import Message, Thread
from users.serializers import ProfileSerializer


class ThreadSerializer(WritableNestedModelSerializer):
	profile_1 = ProfileSerializer()
	profile_2 = ProfileSerializer()
	recent_message_body = serializers.SerializerMethodField('recent_message')
	recent_timestamp = serializers.SerializerMethodField('timestamp')

	def recent_message(self, obj):
		return Message.objects.filter(thread__id=obj.id).order_by('timestamp').last().body

	def timestamp(self, obj):
		return Message.objects.filter(thread__id=obj.id).order_by('timestamp').last().timestamp

	class Meta:
		model = Thread
		fields = ('id', 'profile_1', 'profile_2', 'recent_message_body', 'recent_timestamp', )
		read_only_fields = ('id', 'profile_1', 'profile_2', 'recent_message_body', 'recent_timestamp', )

class MessageSerializer(WritableNestedModelSerializer):
	thread = ThreadSerializer()
	class Meta:
		model = Message
		fields = ('id', 'thread', 'body', 'timestamp', 'read',)
		read_only_fields = ('id', 'thread', 'body', 'timestamp', 'read',)