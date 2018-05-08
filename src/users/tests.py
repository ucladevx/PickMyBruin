# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.core.urlresolvers import reverse
from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from django.contrib.auth.models import User
from .models import Profile, Mentor, Major, Course
from . import factories

# Create your tests here.

class CreateUserTest(APITestCase):
    create_url = reverse('users:create')

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_create_user_has_profile_and_user(self):
        user_params = {
            'email': 'test@g.ucla.edu',
            'password': 'password',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )

        user = User.objects.get(email=user_params['email'])
        profile = Profile.objects.get(user=user)

        self.assertEqual(user.email, user_params['email'])

    def test_user_username_and_email_equal(self):
        user_params = {
            'email': 'test2@g.ucla.edu',
            'password': 'password',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )

        user = User.objects.get(email=user_params['email'])
        self.assertEqual(user.email, user.username)

    def test_create_user_cant_have_illegal_email(self):
        user_params = {
            'email': 'test@veryfakedomain.com@ucla.edu',
            'password': 'password',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )

        self.assertFalse(User.objects.filter(email=user_params['email']).exists())

    def test_create_user_rejects_duplicate_emails(self):
        user_params = {
            'email': 'testCASE@g.ucla.edu',
            'password': 'password',
        }

        user_params_2 = {
            'email': 'testcase@g.ucla.edu',
            'password': 'password',
        }

        resp = self.client.post(
            self.create_url,
            data=user_params,
        )
        
        resp = self.client.post(
            self.create_url,
            data=user_params_2,
        )

        self.assertTrue(User.objects.filter(email=user_params['email']).exists())
        self.assertFalse(User.objects.filter(email=user_params_2['email']).exists())
        self.assertTrue(User.objects.filter(email__iexact=user_params_2['email']).exists())

class VerifyUserTest(APITestCase):
    verify_url = reverse('users:verify')

    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_verify_only_accepts_correct_code(self):
        user_params = {
            'verification_code' : 'fake_code_',
        }

        resp = self.client.post(
            self.verify_url,
            data=user_params,
        )

        self.assertEqual(resp.status_code, 400)
        self.profile.refresh_from_db()
        self.assertEqual(self.profile.verified, False)


    def test_verification_sets_verify_true(self):        
        user_params = {
            'verification_code' : self.profile.verification_code,
        }

        resp = self.client.post(
            self.verify_url,
            data=user_params,
        )
        self.profile.refresh_from_db()
        self.assertEqual(self.profile.verified, True)

class ResetPasswordTest(APITestCase):
    reset_url = reverse('users:password_reset')

    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.profile.password_reset_code = Profile.generate_password_reset_code()
        self.profile.save()

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_reset_changes_password(self):
        old_password = self.profile.user.password
        user_params = {
            'code' : self.profile.password_reset_code,
            'password' : 'new_'+old_password,
            'userid' : self.profile.user.id,
        }

        resp = self.client.post(
            self.reset_url,
            data=user_params,
        )

        self.assertEqual(self.profile.user.password, old_password)
        self.profile.user.refresh_from_db()
        self.assertNotEqual(self.profile.user.password, old_password)

    def test_reset_code_only_works_once(self):
        old_password = self.profile.user.password
        user_params = {
            'code' : self.profile.password_reset_code,
            'password' : 'new_'+old_password,
            'userid' : self.profile.user.id,
        }

        resp = self.client.post(
            self.reset_url,
            data=user_params,
        )
        self.profile.refresh_from_db()
        self.assertEqual(self.profile.password_reset_code, None)

class OwnProfileViewTest(APITestCase):
    own_profile_url = reverse('users:me')
    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)

    def tearDown(self):
        User.objects.all().delete()
        Profile.objects.all().delete()

    def test_own_profile_returns_own_profile(self):
        resp = self.client.get(self.own_profile_url)
        self.assertEqual(self.profile.user.email, resp.data['email'])

    def test_edit_user_fields(self):
        data = {
            'first_name': 'fake',
            'last_name': 'name',
            'email': 'fakename@example.com',
        }
        resp = self.client.patch(self.own_profile_url, data=data)
        for field, val in data.items():
            self.assertEqual(val, resp.data[field])

    def test_phone_validation_accept(self):
        data = {
            'phone_number': '(012)345-6789',
        }
        resp = self.client.patch(self.own_profile_url, data=data)
        self.profile.refresh_from_db()
        self.assertEqual(self.profile.phone_number, resp.data['phone_number'])

    def test_phone_validation_deny(self):
        old_phone = self.profile.phone_number
        data = {
            'phone_number': '0123456789',
        }
        resp = self.client.patch(self.own_profile_url, data=data)
        self.profile.refresh_from_db()
        self.assertEqual(self.profile.phone_number, old_phone)

class MentorsSearchTest(APITestCase):
    mentors_search_url = reverse('users:mentors_search')
    def setUp(self):

        self.major = factories.MajorFactory(name='Major')
        self.mentor = factories.MentorFactory(major=self.major)

        self.major1 = factories.MajorFactory(name='Test_Major')
        self.profile1 = factories.ProfileFactory(year='1st')
        self.mentor1 = factories.MentorFactory(major=self.major1, profile=self.profile1)

        self.major2 = factories.MajorFactory(name='Test_Major2')
        self.profile2 = factories.ProfileFactory(year='2nd')
        self.mentor2 = factories.MentorFactory(major=self.major2, profile=self.profile2)

        self.client.force_authenticate(user=self.mentor.profile.user)

    def tearDown(self):
        User.objects.all().delete()
        Major.objects.all().delete()

    def test_filter_out_self(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major.name,
                'year': 'all',
            },
        )
        self.assertEqual(resp.data['count'], 0)

    def test_correct_major_name_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major1.name,
                'year': 'all',
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['major']['name'], self.mentor1.major.name)

    def test_incorrect_major_name_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major1.name + 'wonrg',
                'year': 'all',
            },
        )
        self.assertEqual(resp.data['count'], 0)

    def test_only_major_name_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major1.name,
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['major']['name'], self.mentor1.major.name)
        
    def test_correct_year_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': 'all',
                'year': self.profile1.year,
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['profile']['year'], self.profile1.year)

    def test_incorrect_year_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': 'all',
                'year': self.profile1.year + 'wonrg',
            },
        )
        self.assertEqual(resp.data['count'], 0)

    def test_only_year_filtering(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'year': self.profile1.year,
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['profile']['year'], self.profile1.year)

    def test_filter_by_none(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
            },
        )
        self.assertEqual(resp.data['count'], 2)
        self.assertEqual(resp.data['results'][0]['profile']['year'], self.profile1.year)
        self.assertEqual(resp.data['results'][1]['profile']['year'], self.profile2.year)

    def test_filter_by_all(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major1.name,
                'year': self.profile1.year,
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['profile']['year'], self.profile1.year)

    def test_more_random_than_available(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'random': 100,
            },
        )
        self.assertEqual(resp.data['count'], 2)

    def test_random_with_other_filters(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'major': self.major1.name,
                'year': self.profile1.year,
                'random': 1,
            },
        )
        self.assertEqual(resp.data['count'], 1)
        self.assertEqual(resp.data['results'][0]['profile']['year'], self.profile1.year)
    
    def test_random_with_no_args(self):
        resp = self.client.get(
            self.mentors_search_url,
            data={
                'random': '',
            },
        )
        self.assertEqual(resp.data['count'], 2)

class UpdateYearTest(APITestCase):
    update_year_url = reverse('users:update_year')

    def setUp(self):
        self.profile0 = factories.ProfileFactory(year='Incoming')
        self.profile1 = factories.ProfileFactory(year='1st')
        self.profile2 = factories.ProfileFactory(year='2nd')
        self.profile3 = factories.ProfileFactory(year='3rd')
        self.profile4 = factories.ProfileFactory(year='4th')
        self.profile5 = factories.ProfileFactory(year='5th+')

    def tearDown(self):
        Profile.objects.all().delete()


    def test_update(self):
        resp = self.client.post(
            self.update_year_url,
        )
        self.assertEqual(self.profile0.year, 'Incoming')
        self.assertEqual(self.profile1.year, '1st')
        self.assertEqual(self.profile2.year, '2nd')
        self.assertEqual(self.profile3.year, '3rd')
        self.assertEqual(self.profile4.year, '4th')
        self.assertEqual(self.profile5.year, '5th+')
        self.profile0.refresh_from_db()
        self.profile1.refresh_from_db()
        self.profile2.refresh_from_db()
        self.profile3.refresh_from_db()
        self.profile4.refresh_from_db()
        self.profile5.refresh_from_db()
        self.assertEqual(self.profile0.year, '1st')
        self.assertEqual(self.profile1.year, '2nd')
        self.assertEqual(self.profile2.year, '3rd')
        self.assertEqual(self.profile3.year, '4th')
        self.assertEqual(self.profile4.year, '5th+')
        self.assertEqual(self.profile5.year, '5th+')


class MentorsUpdateTest(APITestCase):
    mentors_update_url = reverse('users:mentors_me')
    def setUp(self):
        self.mentor = factories.MentorFactory()
        self.client.force_authenticate(user=self.mentor.profile.user)
        self.major = factories.MajorFactory(name='Test Major')
    
    def tearDown(self):
        User.objects.all().delete()
        Major.objects.all().delete()

    def test_set_mentor_as_inactive(self):
        user_params = {
            'active' : False,
        }

        resp = self.client.patch(
            self.mentors_update_url,
            data=user_params,
        )
        self.mentor.refresh_from_db()
        self.assertEqual(self.mentor.active, False)
        
    def test_set_mentor_as_active(self):
        resp = self.client.post(
            self.mentors_update_url,
        )
        self.mentor.refresh_from_db()
        self.assertEqual(self.mentor.active, True)

    def test_patch_major_correct(self):
    
        user_params = {
            'major' : {
                'name' : 'Test Major',
            },
        }

        self.assertEqual(self.mentor.major, None)

        resp = self.client.patch(
            self.mentors_update_url,
            data=user_params,
            format='json',
        )

        self.mentor.refresh_from_db()
        self.assertEqual(self.mentor.major.name, user_params['major']['name'])
        self.assertEqual(len(Major.objects.all()), 1) 
        
    def test_patch_major_404(self):

        self.mentor = factories.MentorFactory(major=self.major)
        
        user_params = {
            'major' : {
                'name' : 'Wrong',
            },
        }

        resp = self.client.patch(
            self.mentors_update_url,
            data=user_params,
            format='json',
        )
    
        self.assertEqual(resp.status_code, status.HTTP_404_NOT_FOUND)
        self.mentor.refresh_from_db()
        self.assertEqual(self.mentor.major.name, self.major.name)
        self.assertEqual(len(Major.objects.all()), 1) 

class CreateMentorTest(APITestCase):
    mentors_create_url = reverse('users:mentors_me')
    def setUp(self):
        self.profile = factories.ProfileFactory()
        self.client.force_authenticate(user=self.profile.user)
    
    def tearDown(self):
        User.objects.all().delete()
        Major.objects.all().delete()

    def test_create_mentor(self):
        self.assertEqual(Mentor.objects.filter(profile = self.profile).exists(), False)
        resp = self.client.post(
            self.mentors_create_url,
        )
        self.assertEqual(Mentor.objects.filter(profile = self.profile).exists(), True)

    def test_makes_existing_mentor_active(self):
        mentor = factories.MentorFactory(profile=self.profile, active=False)
        resp = self.client.post(
            self.mentors_create_url,
        )
        mentor.refresh_from_db()
        self.assertTrue(mentor.active)

class FindMentorByIDTest(APITestCase):
    def setUp(self):
        self.mentor = factories.MentorFactory()
        self.client.force_authenticate(user=self.mentor.profile.user)
    
    def tearDown(self):
        User.objects.all().delete()
        Major.objects.all().delete()

    def test_find_mentor_by_id(self):
        resp = self.client.get(
            reverse('users:mentor',kwargs={'mentor_id':self.mentor.id}),
        )
        self.assertEqual(resp.data['id'], self.mentor.id)

    def test_404_if_mentor_with_id_does_not_exist(self):
        resp = self.client.get(
            reverse('users:mentor',kwargs={'mentor_id': self.mentor.id + 100000000}), #100000000 is to force an invalid mentor ID
        )
        self.assertEqual(resp.status_code, 404)

class CourseEdittingTest(APITestCase):
    mentors_update_url = reverse('users:mentors_me')
    def setUp(self):
        self.mentor = factories.MentorFactory()
        self.client.force_authenticate(user=self.mentor.profile.user)
    
    def tearDown(self):
        User.objects.all().delete()

    def test_update_new_course(self):
        user_params = {
            'courses': [
                { 'name' : 'New_Course' },
            ],
        }
        resp = self.client.patch(
            self.mentors_update_url,
            data=user_params,
            format='json',
        )
        self.mentor.refresh_from_db()
        courses = self.mentor.courses.all()
        self.assertEqual(len(courses), 1)
        self.assertEqual(courses[0].name, 'New_Course')

    def test_update_removes_old_courses(self):
        old_course = Course(name='Old Course')
        old_course.save()
        self.mentor.courses.add(old_course)

        courses = self.mentor.courses.all()
        self.assertEqual(len(courses), 1)
        self.assertEqual(courses[0].name, old_course.name)

        user_params = {
            'courses': [
                { 'name' : 'New_Course' },
            ],
        }
        resp = self.client.patch(
            self.mentors_update_url,
            data=user_params,
            format='json',
        )
        self.mentor.refresh_from_db()
        courses = self.mentor.courses.all()
        self.assertEqual(len(courses), 1)
        self.assertEqual(courses[0].name, 'New_Course')

