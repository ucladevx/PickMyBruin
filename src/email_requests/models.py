from django.db import models

from django.contrib.auth.models import User

from users.models import Profile, Mentor
# Create your models here.


class Request(models.Model):
	mentee = models.ForeignKey(Profile, null=True, on_delete=models.SET_NULL)
	mentor = models.ForeignKey(Mentor, null=True, on_delete=models.SET_NULL)
	email_body = models.TextField(null=False, blank=True, default = '')
	preferred_email = models.CharField(max_length=100, null=False, blank=False, default = '')
	phone = models.CharField(max_length=20, null=False, blank=True, default = '')
	date_created = models.DateTimeField(auto_now=False, auto_now_add=True)


	def __str__(self):
		return '%s requeted %s at %s' % (self.mentee, self.mentor, self.date_created)

 