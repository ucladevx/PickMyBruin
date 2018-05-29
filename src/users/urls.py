from django.conf.urls import include, url

from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'profiles', views.ProfileViewSet)
router.register(r'majors', views.MajorViewSet)
router.register(r'mentors', views.MentorViewSet)
router.register(r'courses', views.CourseViewSet)

urlpatterns = [
    url(r'^mentors/me/?$', views.OwnMentorView.as_view(), name='mentors_me'),
    url(r'^users/me/?$', views.OwnProfileView.as_view(), name='me'),
    url(r'^mentors/(?P<mentor_id>[0-9]+)/?$', views.MentorView.as_view(), name = 'mentor'),
    url(r'^mentors/?$', views.MentorsSearchView.as_view(), name='mentors_search'),
    url(r'^users/?$', views.CreateUser.as_view(), name='create'),
    url(r'^verify/?$', views.VerifyUser.as_view(), name='verify'),
    url(r'^verify_link/?$', views.ResendVerifyUser.as_view(), name='verify_link'),
    url(r'^password/?$', views.PasswordReset.as_view(), name='password_reset'),
    url(r'^password_link/?$', views.SendPasswordReset.as_view(), name='password_reset_link'),
    url(r'^update_year/?$', views.UpdateProfileYearAWS.as_view(), name='update_year'),
    url(r'^report_user/?$', views.ReportUser.as_view(), name='report_user'),
]