# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-16 04:15
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('email_requests', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='request',
            old_name='preferred_email',
            new_name='preferred_mentee_email',
        ),
    ]
