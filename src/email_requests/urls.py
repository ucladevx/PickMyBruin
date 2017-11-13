from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^(?P<mentor_id>[0-9]+)/$', views.EmailRequestView.as_view(), name='send_email')
]
