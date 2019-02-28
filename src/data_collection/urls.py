from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^log/$', views.DataLogView.as_view(), name='log_data'),
]
