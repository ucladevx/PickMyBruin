from django.conf.urls import include,url
from . import views

urlpatterns = [
            url(r'^blogs/(?P<username>[0-9]+)/?$', views.CreateBlogView.as_view(),
                name="createview"),
        ]
