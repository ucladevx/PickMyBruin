# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-01-10 01:08
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0012_auto_20171206_1736'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='year',
            field=models.CharField(choices=[('1st', '1st'), ('2nd', '2nd'), ('3rd', '3rd'), ('4th', '4th')], default='1st', max_length=15),
        ),
    ]
