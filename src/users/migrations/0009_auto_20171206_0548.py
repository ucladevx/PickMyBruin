# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-12-06 05:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_auto_20171128_0118'),
    ]

    operations = [
        migrations.AddField(
            model_name='mentor',
            name='classes',
            field=models.CharField(blank=True, default='', max_length=5000),
        ),
        migrations.AddField(
            model_name='mentor',
            name='clubs',
            field=models.CharField(blank=True, default='', max_length=500),
        ),
        migrations.AddField(
            model_name='mentor',
            name='cons',
            field=models.CharField(blank=True, default='', max_length=5000),
        ),
        migrations.AddField(
            model_name='mentor',
            name='gpa',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=4),
        ),
        migrations.AddField(
            model_name='mentor',
            name='pros',
            field=models.CharField(blank=True, default='', max_length=5000),
        ),
        migrations.AlterField(
            model_name='profile',
            name='picture',
            field=models.ImageField(blank=True, default='http://corgi.marktai.com/image', null=True, upload_to='profile_pictures/'),
        ),
    ]
