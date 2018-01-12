from rest_framework import serializers
from rest_framework.fields import ListField
from drf_writable_nested import WritableNestedModelSerializer
from django.shortcuts import render, get_object_or_404

from django.contrib.auth.models import User, Group
from .models import Profile, Major, Mentor, Classes


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

        fields = ('id', 'first_name', 'last_name', 'email', 'year', 'verified', 'picture')
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

class ClassesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classes
        fields = ('id', 'name')
        read_only_fields = ('id',)

class MentorSerializer(WritableNestedModelSerializer):
    profile = ProfileSerializer()
    major = MajorSerializer()
    classes = ClassesSerializer(many=True)
    class Meta:
        model = Mentor
        fields = ('id', 'profile', 'active', 'major', 'bio', 'gpa', 'clubs', 'classes', 'pros', 'cons',)
        read_only_fields = ('id',)


    def update(self, instance, validated_data):
        import pprint
        pprint.pprint(validated_data)
        if 'classes' in validated_data:
            classes_obj = validated_data.pop('classes')

            print(classes_obj)
            for klass in classes_obj:
                print(klass)
                d=dict(klass)
                c, _ = Classes.objects.get_or_create(name=klass['name'])
                print(c)
                instance.classes.add(c)
                instance.save()

        if 'major' in validated_data:
            major_obj = validated_data.pop('major')
            major_text = major_obj['name']
            major_object = get_object_or_404(Major, name=major_text)
            instance.major = major_object
            instance.save()
        return super().update(instance, validated_data)


