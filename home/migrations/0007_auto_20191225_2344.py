# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-12-25 15:44
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0006_auto_20191225_2117'),
    ]

    operations = [
        migrations.CreateModel(
            name='YibanManProduct',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=255, verbose_name='图片路径')),
                ('name', models.CharField(max_length=64, null=True, verbose_name='图片名称')),
                ('datetime', models.DateTimeField(default='2019-8-8', verbose_name='图片日期')),
                ('source', models.CharField(default='/', max_length=255, verbose_name='图片来源')),
                ('longname', models.CharField(max_length=60, verbose_name='长名称')),
                ('brandname', models.CharField(default='尚丝蔓', max_length=255, verbose_name='品牌名称')),
                ('mainprice', models.DecimalField(decimal_places=2, default=99, max_digits=9, verbose_name='商品主价格')),
                ('shopid', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='manproducts', to='home.YibanShop')),
            ],
            options={
                'db_table': 'yiban_man_product',
            },
        ),
        migrations.AlterField(
            model_name='yibanproduct',
            name='brandname',
            field=models.CharField(default='尚丝蔓', max_length=255, verbose_name='品牌名称'),
        ),
    ]