# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-01-24 22:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tournament', '0143_auto_20170124_2017'),
    ]

    operations = [
        migrations.AddField(
            model_name='league',
            name='enable_notifications',
            field=models.BooleanField(default=False),
        ),
    ]