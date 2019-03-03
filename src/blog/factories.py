import factory
from django.contrib.auth.models import User
from django.utils import timezone
from .models import *
from faker import Faker
fake = Faker()

class BlogFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = BlogPost
    title = factory.Faker('sentence',nb_words=4)
    body = fake.text()
    anonymous = False
    publish = True
    published = timezone.now()

class AnonymousBlogFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = BlogPost
    title = factory.Faker('sentence',nb_words=4)
    body = fake.text()
    anonymous = True
    publish = True
    published = timezone.now()


