import factory
from django.contrib.auth.models import User
from .models import *
from faker import Faker
fake = Faker()

class BlogFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = BlogPost
    title = factory.Faker('sentence',nb_words=4)
    body = fake.text()
    anonymous = False

class AnonymousBlogFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = BlogPost
    title = factory.Faker('sentence',nb_words=4)
    body = fake.text()
    anonymous = True


