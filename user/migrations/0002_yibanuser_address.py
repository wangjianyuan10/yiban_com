# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-12-28 08:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='yibanuser',
            name='address',
            field=models.CharField(default='广东深圳市后瑞地铁站西部硅谷', max_length=255, verbose_name='收货地址'),
        ),
    ]
