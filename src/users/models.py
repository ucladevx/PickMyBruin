# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string

from django.db import models
from django.contrib.postgres.fields import ArrayField

from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):
    YEAR_CHOICES = (
        ('1st', '1st'),
        ('2nd', '2nd'),
        ('3rd', '3rd'),
        ('4th', '4th'),
    )

    VERIFICATION_CHAR_NUM = 10
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    verified = models.BooleanField(default=False)
    verification_code = models.CharField(max_length=VERIFICATION_CHAR_NUM, null=True, default=None, blank=True)
    picture = models.ImageField(upload_to='profile_pictures/', null=True, blank=True, default='profile_pictures/default_pic.jpg')
    year = models.CharField(max_length=15, choices=YEAR_CHOICES, default='1')

    @staticmethod
    def generate_verification_code():
        return ''.join(random.choices(string.ascii_uppercase+string.digits, k=Profile.VERIFICATION_CHAR_NUM))

    def __str__(self):
        return str(self.user)

class Major(models.Model):
    name = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.name

class Mentor(models.Model):
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    major = models.ForeignKey(Major, null=True, on_delete=models.SET_NULL)
    bio = models.CharField(max_length=5000, null=False, blank=True, default='')
    active = models.BooleanField(default=True)
    gpa = models.DecimalField(default=0.00, max_digits=4, decimal_places=2)
    clubs = models.CharField(max_length=500, null=False, blank=True, default='')
    classes = models.CharField(max_length=5000, null=False, blank=True, default='')
    pros =  models.CharField(max_length=5000, null=False, blank=True, default='')
    cons =  models.CharField(max_length=5000, null=False, blank=True, default='')
    
    def __str__(self):
        return '%s (%s)' % (self.profile, self.major)


