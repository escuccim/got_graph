# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-11-07 12:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('graph', '0008_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='title',
            field=models.ForeignKey(blank=True, default=9, on_delete=django.db.models.deletion.DO_NOTHING, to='graph.Title'),
        ),
    ]
