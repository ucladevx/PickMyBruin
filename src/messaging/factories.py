import factory
from django.contrib.auth.models import User
from users.factories import ProfileFactory
from . import models

class MessageFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Message
    thread = factory.SubFactory(ThreadFactory)
    
class ThreadFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Thread
    profile_1 = factory.SubFactory(ProfileFactory)
    profile_2 = factory.SubFactory(ProfileFactory)
    