from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from users.models import Profile, Mentor
from .models import Request
from users.serializers import ProfileSerializer, MentorSerializer



class RequestSerializer(WritableNestedModelSerializer):
    mentee = ProfileSerializer()
    mentor = MentorSerializer()
    class Meta:
        model = Request
        fields = ('mentee', 'mentor', 'email_body', 'preferred_mentee_email', 'phone', 'date_created',)
        read_only_fields = ('mentee', 'mentor', 'email_body', 'preferred_mentee_email', 'phone', 'date_created',)