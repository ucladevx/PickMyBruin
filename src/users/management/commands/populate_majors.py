from django.core.management.base import BaseCommand
from users.models import Major
from django.db import IntegrityError
from os import path
import json


class Command(BaseCommand):

    def _create_majors(self):
        base_path = path.dirname(__file__)
        majors_path = path.abspath(path.join(base_path, "..", "..", "majors.json"))

        with open(majors_path) as majors_file:
            majors = json.load(majors_file)
            for major in majors:
                major_entry = Major(name=major)

                try:
                    major_entry.save()
                except IntegrityError:
                    pass


    def handle(self, *args, **kwargs):
        self._create_majors()

