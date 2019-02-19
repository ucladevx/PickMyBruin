from django.conf.urls import include,url
from . import views

urlpatterns = [
            url(r'^blogs/(?P<username>[\w.@+-]+)/?$', views.CreateBlogView.as_view(),
                name="createview"),
            url(r'^blogs/?$', views.BlogView.as_view(), name='blogs'),
            url(r'^blogs/id/(?P<blog_id>[0-9]+)/?$', views.RUDBlogView.as_view(), name='RUD'),
        ]
