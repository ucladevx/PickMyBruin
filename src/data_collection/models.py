from django.db import models
from django.contrib.postgres.fields import JSONField

# Create your models here.

class Data(models.Model):
	date_created = models.DateTimeField(auto_now_add=True)
	#type
	log = JSONField()

	def __str__(self):
		return '%d: %s' % (self.ID, str(self.log))