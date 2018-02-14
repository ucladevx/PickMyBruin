from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^(?P<profile_id>[0-9]+)/$', views.SendMessageView.as_view(), name='send_message'),
    url(r'^me/$', views.ListOwnMessagesView.as_view(), name='message_list'),
    url(r'^/read/(?P<message_id>[0-9]+)/$', views.readMessageView.as_view(), name='read_message'),
    url(r'^/check/(?P<profile_id>[0-9]+)/$', views.checkHistoryView.as_view(), name='check_history'),
]
