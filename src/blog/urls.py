from django.conf.urls import include,url
from . import views

urlpatterns = [
            url(r'^blogs/(?P<username>[\w.@+-]+)/?$', views.CreateBlogView.as_view(),
                name="createview"),
        ]
