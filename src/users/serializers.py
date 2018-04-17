from rest_framework import serializers
from rest_framework.fields import ListField
from drf_writable_nested import WritableNestedModelSerializer
from django.shortcuts import render, get_object_or_404

from django.contrib.auth.models import User, Group
from .models import Profile, Major, Mentor, Minor, Course


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


class ProfileSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField(source='user.first_name')
    last_name = serializers.CharField(source='user.last_name')
    email = serializers.CharField(source='user.email')

    class Meta:
        model = Profile
        fields = ('id', 'first_name', 'last_name', 'email', 'year', 'verified', 'picture', 'notifications_enabled', 'phone_number')
        read_only_fields = ('id', 'verified')

    def update(self, instance, validated_data):
        if 'user' in validated_data:
            user_data = validated_data.pop('user')
            for field, val in user_data.items():
                setattr(instance.user, field, val)
            instance.user.save()
        return super().update(instance, validated_data)


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ('id', 'name')
        read_only_fields = ('id',)

class MinorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Minor
        fields = ('id', 'name')
        read_only_fields = ('id',)

class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = ('id', 'name')
        read_only_fields = ('id',)

class MentorSerializer(WritableNestedModelSerializer):
    profile = ProfileSerializer()
    major = MajorSerializer()
    minor = MinorSerializer(many=True)
    courses = CourseSerializer(many=True)
    class Meta:
        model = Mentor
        fields = ('id', 'profile', 'active', 'major', 'minor', 'bio', 'gpa', 'clubs', 'courses', 'pros', 'cons',)
        read_only_fields = ('id',)


    def update(self, instance, validated_data):
        if 'courses' in validated_data:
            instance.courses.clear()
            courses_obj = validated_data.pop('courses')
            for klass in courses_obj:
                dict(klass)
                c, _ = Course.objects.get_or_create(name=klass['name'])
                instance.courses.add(c)
                instance.save()

        if 'major' in validated_data:
            major_obj = validated_data.pop('major')
            major_text = major_obj['name']
            major_object = get_object_or_404(Major, name=major_text)
            instance.major = major_object
            instance.save()
        return super().update(instance, validated_data)

