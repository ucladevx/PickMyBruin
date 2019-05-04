from django.conf.urls import include,url
from . import views



urlpatterns = [
            url(r'^blogs/comment/?$', views.CreateCommentView.as_view(),name='comment'),
            url(r'^blogs/comment/(?P<comment_id>[0-9]+)/?$', views.RUDCommentView.as_view(),name='RUDComment'),
            url(r'^blogs/(?P<username>[\w.@+-]+)/?$', views.CreateBlogView.as_view(), name="createview"),
            url(r'^blogs/?$', views.BlogView.as_view(), name='blogs'),
            url(r'^blogs/id/(?P<blog_id>[0-9]+)/?$', views.RUDBlogView.as_view(), name='RUDBlog'),
        ]
