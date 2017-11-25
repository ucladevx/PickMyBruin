from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from django.contrib.auth.models import User, Group
from .models import Profile, Major, Mentor


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')

    def save(self, *args, **kwargs):
        if 'email' in self.validated_data:
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
        fields = ('id', 'user', 'verified', 'picture')
        read_only_fields = ('id', 'verified')


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ('id', 'name')
        read_only_fields = ('id',)


class MentorSerializer(WritableNestedModelSerializer):
    profile = ProfileSerializer()
    major = MajorSerializer()
    class Meta:
        model = Mentor
        fields = ('id', 'profile', 'active', 'major', 'bio')
        read_only_fields = ('id',)

