from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from .models import Profile, Major, Mentor


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'first_name', 'last_name', 'email')
        read_only_fields = ('id',)

    def save(self, *args, **kwargs):
        self.validated_data['username'] = self.validated_data['email']
        super().save(*args, **kwargs)


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'name')
        read_only_fields = ('id',)


class ProfileSerializer(WritableNestedModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Profile
        fields = ('id', 'user', 'bio')
        read_only_fields = ('id', 'user',)


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ('id', 'name')
        read_only_fields = ('id',)


class MentorSerializer(WritableNestedModelSerializer):
    profile = ProfileSerializer()
    class Meta:
        model = Profile
        fields = ('id', 'profile', 'active', 'major', 'bio')
        read_only_fields = ('id',)
