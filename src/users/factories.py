import factory
from faker import Faker
from django.contrib.auth.models import User
from . import models

class UserFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = User
    first_name = factory.Faker('first_name')
    last_name = factory.Faker('last_name')
    email = factory.LazyAttribute(lambda a: '{0}.{1}@example.com'.format(a.first_name, a.last_name).lower())
    username = factory.LazyAttribute(lambda a: a.email)

class ProfileFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Profile
    user = factory.SubFactory(UserFactory)
    verification_code = factory.LazyAttribute(lambda a: models.Profile.generate_verification_code())

class MajorFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Major

class MinorFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Minor


class CourseFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Course

class MentorFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Mentor
    profile = factory.SubFactory(ProfileFactory)
    active = True

    @factory.post_generation
    def major(self, create, extracted, **kwargs):
        if not create:
            return
        if extracted:
            for major in extracted:
                self.major.add(major)

    @factory.post_generation
    def minor(self, create, extracted, **kwargs):
        if not create:
            return
        if extracted:
            for minor in extracted:
                self.minor.add(minor)

    @factory.post_generation
    def courses(self, create, extracted, **kwargs):
        if not create:
            return
        if extracted:
            for courses in extracted:
                self.courses.add(courses)


