from django.core.management.base import BaseCommand
from users.models import Profile



class Command(BaseCommand):
    def _update_year(self):
        queryset = Profile.objects.all()
        queryset.filter(year=SENIOR).update(year=SUPERSENIOR)
        queryset.filter(year=JUNIOR).update(year=SENIOR)
        queryset.filter(year=SOPHOMORE).update(year=JUNIOR)
        queryset.filter(year=FRESHMAN).update(year=SOPHOMORE)
        queryset.filter(year=INCOMING).update(year=FRESHMAN)


    def handle(self, *args, **kwargs):
        self._update_year()

