# Generated by Django 3.1.14 on 2022-02-18 12:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0009_auto_20220218_1201'),
    ]

    operations = [
        migrations.AlterField(
            model_name='trainer',
            name='gender',
            field=models.CharField(choices=[('Male', 'Male'), ('Female', 'Female')], default='Female', max_length=6),
        ),
    ]