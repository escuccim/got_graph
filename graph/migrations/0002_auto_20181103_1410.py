# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-11-03 13:10
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('graph', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='person',
            name='house',
            field=models.ForeignKey(blank=True, default=None, on_delete=django.db.models.deletion.CASCADE, to='graph.House'),
        ),
    ]
