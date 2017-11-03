# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, get_object_or_404

# Create your views here.

from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics

from django.contrib.auth.models import User, Group

from .models import Profile, Major, Mentor
from .serializers import (
    UserSerializer, GroupSerializer, ProfileSerializer, MajorSerializer, 
    MentorSerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class ProfileViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows profiles to be viewed or edited.
    """
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer 


class MajorViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows majors to be viewed or edited.
    """
    queryset = Major.objects.all()
    serializer_class = MajorSerializer


class MentorViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows mentors to be viewed or edited.
    """
    queryset = Mentor.objects.all()
    serializer_class = MentorSerializer

class NewUserView(APIView):
    """
    View to create a new user

    * Currently doesn't do any checking on authentic requests or captcha
    """
    permission_classes = tuple()

    def post(self, request):
        new_user = User.objects.create_user(
            username=request.data['email'],
            email=request.data['email'],
            password=request.data['password'],
            first_name=request.data.get('first_name', ''),
            last_name=request.data.get('last_name', ''),
        )

        new_profile = Profile(
            user=new_user,
        )
        new_profile.save()
        return Response(ProfileSerializer(new_profile).data)

# class OwnProfileView(APIView):
#     def get(self, request):
#         profile = Profile.objects.get(user=request.user)
#         return Response(ProfileSerializer(profile).data)
# 
class OwnProfileView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ProfileSerializer
    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user)

    def post(self, *args, **kwargs):
        super().post(*args, **kwargs)



class MentorsSearchView(generics.ListAPIView):
    queryset = Mentor.objects.all()
    serializer_class = MentorSerializer

    def filter_queryset(self, queryset):
        major = self.request.query_params['major']
        return queryset.filter(major__name=major)

    

