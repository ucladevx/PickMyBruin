# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string

from django.db import models
from django.contrib.postgres.fields import ArrayField

from django.contrib.auth.models import User

from django.db.models.signals import m2m_changed

from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator


# Create your models here.
class Profile(models.Model):
    INCOMING = 'Incoming'
    FRESHMAN = '1st'
    SOPHOMORE = '2nd'
    JUNIOR = '3rd'
    SENIOR = '4th'
    SUPERSENIOR = '5th+'
    YEAR_CHOICES = (
        (INCOMING, 'Incoming'),
        (FRESHMAN, '1st'),
        (SOPHOMORE, '2nd'),
        (JUNIOR, '3rd'),
        (SENIOR, '4th'),
        (SUPERSENIOR, '5th+'),
    )


    VERIFICATION_CHAR_NUM = 10
    PASSWORD_RESET_CHAR_NUM = 20

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    verified = models.BooleanField(default=False)
    verification_code = models.CharField(max_length=VERIFICATION_CHAR_NUM, null=True, default=None, blank=True)
    picture = models.ImageField(upload_to='profile_pictures/', null=True, blank=True, default='profile_pictures/default_pic.jpg')
    year = models.CharField(max_length=15, choices=YEAR_CHOICES, default=INCOMING)
    notifications_enabled = models.BooleanField(default=True)
    phone_regex = RegexValidator(regex=r'^\([0-9]{3}\)[0-9]{3}[-][0-9]{4}$', message='Phone number must be entered in the format: (012)345-6789')
    phone_number = models.CharField(validators=[phone_regex], max_length=13, blank=True) 
    password_reset_code = models.CharField(max_length=PASSWORD_RESET_CHAR_NUM, null=True, default=None, blank=True)
    
    @staticmethod
    def generate_verification_code():
        return ''.join(random.choices(string.ascii_uppercase+string.digits, k=Profile.VERIFICATION_CHAR_NUM))
    @staticmethod
    def generate_password_reset_code():
        return ''.join(random.choices(string.ascii_uppercase+string.digits, k=Profile.PASSWORD_RESET_CHAR_NUM))


    def __str__(self):
        return str(self.user)

    #extract "Username"
    def get_username(self):
        return self.user.email.split('@')[0]

class Major(models.Model):
    name = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.name
    class Meta:
         ordering = ('name',)

class Minor(models.Model):
    name = models.CharField(max_length=100, null=False)
 
    def __str__(self):
         return self.name
    class Meta:
         ordering = ('name',)

class Course(models.Model):
    name = models.CharField(max_length=200, null=False)

    def __str__(self):
        return self.name
    class Meta:
        ordering = ('name',)


class Mentor(models.Model):
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    major = models.ManyToManyField(Major, blank=True)
    minor = models.ManyToManyField(Minor, blank=True)
    bio = models.CharField(max_length=5000, null=False, blank=True, default='')
    active = models.BooleanField(default=True)
    gpa = models.DecimalField(default=0.00, max_digits=4, decimal_places=2)
    clubs = models.CharField(max_length=500, null=False, blank=True, default='')
    courses = models.ManyToManyField(Course, blank=True)
    pros =  models.CharField(max_length=5000, null=False, blank=True, default='')
    cons =  models.CharField(max_length=5000, null=False, blank=True, default='')
    
    class Meta:
    	ordering = ('profile',)
    def __str__(self):
        return '%s (%s)' % (self.profile, self.major)

def minor_changed(sender, **kwargs):
    if kwargs['instance'].minor.count() > 3:
        raise ValidationError("You can't assign more than three minors", code='invalid')
m2m_changed.connect(minor_changed, sender=Mentor.minor.through)

def major_changed(sender, **kwargs):
    if kwargs['instance'].major.count() > 2:
        raise ValidationError("You can't assign more than two majors", code='invalid')
m2m_changed.connect(major_changed, sender=Mentor.major.through)
