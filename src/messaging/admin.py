from __future__ import unicode_literals

from django.contrib import admin
from . import models

# Register your models here.

@admin.register(models.Message)
class MessageAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Thread)
class ThreadAdmin(admin.ModelAdmin):
    pass
