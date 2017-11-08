# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):
	VERIFICATION_CHAR_NUM = 10
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    verified = models.BooleanField(default=False)
    verification_code = models.CharField(max_length=VERIFICATION_CHAR_NUM)

    def __str__(self):
        return str(self.user)

class Major(models.Model):
    name = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.name

class Mentor(models.Model):
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    major = models.ForeignKey(Major, null=True, on_delete=models.SET_NULL)
    bio = models.CharField(max_length=5000, null=False, blank=True, default = '')
    active = models.BooleanField(default=True)

    def __str__(self):
        return '%s (%s)' % (self.profile, self.major)


