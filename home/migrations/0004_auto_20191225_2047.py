# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-12-25 12:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0003_auto_20191225_2043'),
    ]

    operations = [
        migrations.AlterField(
            model_name='yibanproduct',
            name='uploaddate',
            field=models.DateTimeField(default='2018-2-3', verbose_name='上传日期'),
        ),
    ]
