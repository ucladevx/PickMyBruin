from django.db import models

from users.models import Profile
# Create your models here.

class Thread(models.Model):
	profile_1 = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
	profile_2 = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)

class Message(models.Model):
	thread = models.ForeignKey(Thread, null=true, on_delete=models.SET_NULL)
	body = models.TextField(null=False, default = '')
	timestamp = models.DateTimeField(auto_now_add=True)
	read = models.BooleanField(default=False)