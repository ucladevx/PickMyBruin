from django.core.management.base import BaseCommand
from users.models import Major, Minor, Course
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

    def _create_minors(self):
        base_path = path.dirname(__file__)
        minors_path = path.abspath(path.join(base_path, "..", "..", "minors.json"))

        with open(minors_path) as minors_file:
            minors = json.load(minors_file)
            for minor in minors:
                minor_entry = Minor(name=minor)
                try:
                    minor_entry.save()
                except IntegrityError:
                    pass

    def _create_courses(self):
        base_path = path.dirname(__file__)
        courses_path = path.abspath(path.join(base_path, "..", "..", "courses.json"))

        with open(courses_path) as courses_file:
            courses = json.load(courses_file)
            for course in courses:
                course_entry = Course(name=course)
                try:
                    course_entry.save()
                except IntegrityError:
                    pass


    def handle(self, *args, **kwargs):
        self._create_majors()
        self._create_minors()
        self._create_courses()

