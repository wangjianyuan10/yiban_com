# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-12-28 11:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0002_auto_20191228_1918'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='phone',
            field=models.CharField(default='', max_length=30, verbose_name='手机'),
        ),
        migrations.AddField(
            model_name='order',
            name='toaddress',
            field=models.CharField(default='', max_length=100, verbose_name='订单地址'),
        ),
        migrations.AddField(
            model_name='order',
            name='tousername',
            field=models.CharField(default='', max_length=50, verbose_name='收货人姓名'),
        ),
    ]
