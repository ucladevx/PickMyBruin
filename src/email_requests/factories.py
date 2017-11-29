import factory
from django.contrib.auth.models import User
from users.factories import ProfileFactory, MentorFactory
from . import models


class RequestFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Request
    mentee = factory.SubFactory(ProfileFactory)
    mentor = factory.SubFactory(MentorFactory)

