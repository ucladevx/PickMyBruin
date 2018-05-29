from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^(?P<profile_id>[0-9]+)/$', views.SendGetMessagesView.as_view(), name='send_get_messages'),
    url(r'^me/$', views.ListOwnThreadsView.as_view(), name='thread_list'),
    url(r'^$', views.ListOwnThreadsView.as_view(), name='thread_list'),
    url(r'^read/(?P<thread_id>[0-9]+)/$', views.ReadThreadView.as_view(), name='read_thread'),
    url(r'^check/(?P<profile_id>[0-9]+)/$', views.CheckHistoryView.as_view(), name='check_history'),
]
