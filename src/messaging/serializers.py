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
	recent_message = serializers.SerializerMethodField()
	other_profile = serializers.SerializerMethodField()
	
	def get_recent_message(self, obj):
		return MessageSerializer(Message.objects.filter(thread__id=obj.id).order_by('timestamp').last()).data

	def get_other_profile(self, obj):
		my_user = self.context['request'].user

		if my_user == obj.profile_1.user:
			return ProfileSerializer(obj.profile_2).data

		return ProfileSerializer(obj.profile_1).data

	class Meta:
		model = Thread
		fields = ('id', 'other_profile', 'recent_message', )
		read_only_fields = ('id', 'other_profile', 'recent_message', )
