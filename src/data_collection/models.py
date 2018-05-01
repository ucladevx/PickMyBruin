from django.db import models
from django.contrib.postgres.fields import JSONField

# Create your models here.

class Data(models.Model):
	data_type = models.CharField(max_length=100, null=False)
	date_created = models.DateTimeField(auto_now_add=True)
	log = JSONField()

	def __str__(self):
		return '%s: %s' % (self.data_type, self.log)