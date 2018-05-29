from django.core.management.base import BaseCommand
from users.models import Profile
# from django.db import IntegrityError
# from os import path
# import json


class Command(BaseCommand):
    def _update_year(self):
        # base_path = path.dirname(__file__)
        # majors_path = path.abspath(path.join(base_path, "..", "..", "majors.json"))

        # with open(majors_path) as majors_file:
        #     majors = json.load(majors_file)
        #     for major in majors:
        #         major_entry = Major(name=major)
        #         try:
        #             major_entry.save()
        #         except IntegrityError:
        #             pass
        queryset = Profile.objects.all()
        queryset.filter(year='4th').update(year='5th+')
        queryset.filter(year='3rd').update(year='4th')
        queryset.filter(year='2nd').update(year='3rd')
        queryset.filter(year='1st').update(year='2nd')
        queryset.filter(year='Incoming').update(year='1st')
        # for mentor_id in options['mentor_id']:
        #     try:
        #         poll = Poll.objects.get(pk=poll_id)
        #     except Poll.DoesNotExist:
        #         raise CommandError('Poll "%s" does not exist' % poll_id)

        #     poll.opened = False
        #     poll.save()

        #     self.stdout.write(self.style.SUCCESS('Successfully closed poll "%s"' % poll_id))


    def handle(self, *args, **kwargs):
        self._update_year()

