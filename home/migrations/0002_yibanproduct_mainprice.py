# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-12-25 12:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='yibanproduct',
            name='mainprice',
            field=models.IntegerField(default=99, verbose_name='商品主价格'),
        ),
    ]
