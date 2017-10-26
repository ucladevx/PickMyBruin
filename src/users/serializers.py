from rest_framework import serializers

from django.contrib.auth.models import User, Group
from .models import Profile, Major, Mentor

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email')


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'name')


class ProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Profile
        fields = ('id', 'user', 'bio')
        read_only_fields = ('user',)


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ('id', 'name')


class MentorSerializer(serializers.ModelSerializer):
    profile = ProfileSerializer()
    class Meta:
        model = Profile
        fields = ('id', 'profile', 'active', 'major', 'bio')
