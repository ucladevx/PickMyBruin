from django.core.management.base import BaseCommand
from users.models import Minor
from django.db import IntegrityError
from os import path
import json


class Command(BaseCommand):
    def _create_minors(self):
        base_path = path.dirname(__file__)
        minors_path = path.abspath(path.join(base_path, "..", "..", "minors.json"))

        with open(minors_path) as minors_file:
            minors = json.load(minors_file)
            for minor in minors:
                minor_entry = minor(name=minor)
                try:
                    minor_entry.save()
                except IntegrityError:
                    pass


    def handle(self, *args, **kwargs):
        self._create_minors()

