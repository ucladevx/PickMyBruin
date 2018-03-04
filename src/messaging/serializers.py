from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from users.models import Profile
from .models import Message, Thread
from users.serializers import ProfileSerializer


class MessageSerializer(WritableNestedModelSerializer):
	sender = ProfileSerializer()
	class Meta:
		model = Message
		fields = ('id', 'sender', 'body', 'timestamp', 'unread',)
		read_only_fields = ('id', 'sender', 'body', 'timestamp', 'unread',)


class ThreadSerializer(WritableNestedModelSerializer):
	profile_1 = ProfileSerializer()
	profile_2 = ProfileSerializer()
	recent_message = serializers.SerializerMethodField()

	def get_recent_message(self, obj):
		return MessageSerializer(Message.objects.filter(thread__id=obj.id).order_by('timestamp').last()).data

	class Meta:
		model = Thread
		fields = ('id', 'profile_1', 'profile_2', 'recent_message', )
		read_only_fields = ('id', 'profile_1', 'profile_2', 'recent_message', )
