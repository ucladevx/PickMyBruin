from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^(?P<profile_id>[0-9]+)/$', views.SendGetMessagesView.as_view(), name='send_get_messages'),
    #url(r'^me/$', views.ListOwnMessagesView.as_view(), name='message_list'),
    url(r'^read/(?P<message_id>[0-9]+)/$', views.ReadMessageView.as_view(), name='read_message'),
    url(r'^check/(?P<profile_id>[0-9]+)/$', views.CheckHistoryView.as_view(), name='check_history'),
]
