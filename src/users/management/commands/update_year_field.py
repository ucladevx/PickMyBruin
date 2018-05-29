from django.core.management.base import BaseCommand
from users.models import Profile



class Command(BaseCommand):
    def _update_year(self):
        queryset = Profile.objects.all()
        queryset.filter(year='4th').update(year='5th+')
        queryset.filter(year='3rd').update(year='4th')
        queryset.filter(year='2nd').update(year='3rd')
        queryset.filter(year='1st').update(year='2nd')
        queryset.filter(year='Incoming').update(year='1st')


    def handle(self, *args, **kwargs):
        self._update_year()

