# Generated by Django 3.1.14 on 2022-02-18 10:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20220218_1024'),
    ]

    operations = [
        migrations.RenameField(
            model_name='workoutplan',
            old_name='exercises',
            new_name='exercise',
        ),
    ]
