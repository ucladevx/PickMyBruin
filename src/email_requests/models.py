from django.db import models

from django.contrib.auth.models import User

from users.models import Profile, Mentor
# Create your models here.


class Request(models.Model):
	mentee = models.ForeignKey(Profile, on_delete=models.SET_NULL)
	mentor = models.ForeignKey(Mentor, on_delete=models.SET_NULL)
	email_body = models.CharField(max_length=5000, null=False, blank=True, default = '')
	date_created = models.DateTimeField(auto_now=False, auto_now_add=True)


	def __str__(self):
		return '%s requeted %s at %s' % (self.mentee, self.mentor, self.date_created)

 