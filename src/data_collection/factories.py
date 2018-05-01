import factory
from . import models


class DataFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = models.Data

    date_created = factory.LazyFunction(datetime.datetime.now)