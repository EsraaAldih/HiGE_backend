# Generated by Django 3.1.14 on 2022-02-20 01:38

import api.models
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField()),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('updatedAt', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField()),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('updatedAt', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='ReportComment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='ReportPost',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField()),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('updatedAt', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Trainee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age', models.IntegerField(default=0)),
                ('currentWeight', models.CharField(blank=True, max_length=5, null=True)),
                ('height', models.CharField(max_length=5)),
                ('medicalHistory', models.BooleanField(default=False)),
                ('status', models.CharField(max_length=20, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Trainer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age', models.IntegerField(default=0)),
                ('gender', models.CharField(choices=[('Male', 'Male'), ('Female', 'Female')], default='Female', max_length=6)),
                ('phoneNumber', models.CharField(max_length=11)),
                ('address', models.TextField()),
                ('image', models.ImageField(default='None/no-img.jpg', upload_to='profile/')),
            ],
        ),
        migrations.CreateModel(
            name='WorkoutExcercise',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('duration', models.IntegerField(null=True)),
                ('description', models.CharField(max_length=650)),
                ('gif', models.ImageField(default='exercises/def.jpg', upload_to='exercises/')),
            ],
        ),
        migrations.CreateModel(
            name='YogaExercise',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('details', models.TextField()),
                ('duration', models.IntegerField(validators=[django.core.validators.MinValueValidator(30), django.core.validators.MaxValueValidator(180)])),
                ('image', models.ImageField(default='yogaexercises/default.jpg', upload_to=api.models.upload_to, verbose_name='Image')),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('updatedAt', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='YogaPlan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('description', models.CharField(max_length=70, null=True)),
                ('image', models.ImageField(upload_to='media/')),
                ('status', models.BooleanField(default=False)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('exercises', models.ManyToManyField(blank=True, to='api.YogaExercise')),
                ('owner', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='api.trainer')),
            ],
        ),
        migrations.CreateModel(
            name='WorkoutPlan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=70, null=True)),
                ('image', models.ImageField(default='None/no-img.jpg', upload_to='images/')),
                ('status', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('exercise', models.ManyToManyField(blank=True, to='api.WorkoutExcercise')),
                ('owner', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='api.trainer')),
            ],
        ),
        migrations.CreateModel(
            name='weightTracker',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('currentWeight', models.CharField(max_length=5, null=True)),
                ('traineeID', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.trainee')),
            ],
        ),
    ]
