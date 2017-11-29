from django.conf.urls import include, url

from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'profiles', views.ProfileViewSet)
router.register(r'majors', views.MajorViewSet)
router.register(r'mentors', views.MentorViewSet)

urlpatterns = [
    url(r'^users/me/?$', views.OwnProfileView.as_view(), name='me'),
    url(r'^mentors/?$', views.MentorsSearchView.as_view(), name='mentors_search'),
    url(r'^users/?$', views.CreateUser.as_view(), name='create'),
    url(r'^verify/?$', views.VerifyUser.as_view(), name='verify'),
]