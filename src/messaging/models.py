from django.db import models
from django.db.models import Q

from users.models import Profile
# Create your models here.

class Thread(models.Model):
	profile_1 = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL, related_name='profile_1')
	profile_2 = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL, related_name='profile_2')

	@staticmethod
	def getProfileQuery(prof1, prof2=None):
		query = Q(profile_1=prof1) | Q(profile_2=prof1)
		if prof2 is not None:
			query &= Q(profile_1=prof2) | Q(profile_2=prof2)
		return query

class Message(models.Model):
	thread = models.ForeignKey(Thread, null=True, on_delete=models.CASCADE)
	sender = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
	body = models.TextField(null=False, default = '')
	timestamp = models.DateTimeField(auto_now_add=True)
	unread = models.BooleanField(default=True)