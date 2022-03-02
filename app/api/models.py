from datetime import date
from email import utils
from statistics import mode
from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from django.utils import timezone
from django.conf import settings


def upload_to(instance, filename):
    return 'yogaexercises/{filename}'.format(filename=filename)


class Trainer(models.Model):
    GENDER_CHOICES = (
        ('Male', 'Male'),
        ('Female', 'Female'),
    )
    trainer = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)
    dateOfBirth = models.DateField()
    gender = models.CharField(max_length=6, choices=GENDER_CHOICES, default='Female')
    phoneNumber = models.CharField(max_length=11)
    address = models.TextField()
    image = models.ImageField(upload_to='profile/', default='None/no-img.jpg')

    def __str__(self):
        return self.trainer.username
    @property
    def age(self) :
        today = date.today()
        age=today.year -self.dateOfBirth.year 
        return age
class YogaExercise(models.Model):
    name = models.CharField(max_length=100, null=False,
                            blank=False, unique=True)
    details = models.TextField(null=False, blank=False)
    duration = models.IntegerField(
        validators=[MinValueValidator(30), MaxValueValidator(180)])
    image = models.ImageField(
        _("Image"), upload_to=upload_to, default='yogaexercises/default.jpg')
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Post(models.Model):
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE)
    text = models.TextField()
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)

    @property
    def date(self):
        date = self.createdAt.date()
        return date

    @property
    def time(self):
        time = self.createdAt.time().strftime("%H:%M")
        return time

    def __str__(self):
        return f"{self.createdAt} - {self.owner}"


# yoga plan model
class YogaPlan(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=70, null=True)
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE, default=1)
    exercises = models.ManyToManyField(YogaExercise, blank=True)
    image = models.ImageField(upload_to='media/')
    status = models.BooleanField(default=False)
    createdAt = models.DateTimeField(auto_now_add=True)

    @property
    def totalDuration(self):
        sum = 0
        for i in self.exercises.values():
            sum += i.get('duration')
        return sum

    @property
    def numberOfExercises(self):
        sum = 0
        for i in self.exercises.values():
            sum += 1
        return sum


class WorkoutExcercise(models.Model):
    name = models.CharField(max_length=30)
    duration = models.IntegerField(null=True)
    description = models.CharField(max_length=650)
    gif = models.ImageField(
        upload_to='exercises/', default='exercises/def.jpg')

    def __str__(self):
        return self.name


class WorkoutPlan(models.Model):
    name = models.CharField(max_length=30)
    description = models.CharField(max_length=70, null=True)
    exercise = models.ManyToManyField(WorkoutExcercise, blank=True)
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE, default=1)
    image = models.ImageField(upload_to='images/', default='None/no-img.jpg')
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    @property
    def totalTimeOfExercises(self):
        sum = 0
        for i in self.exercise.values():
            sum += i.get('duration')
        return sum

    @property
    def numberOfEexercises(self):
        sum = 0
        for i in self.exercise.values():
            sum += 1
        return sum
    def __str__(self):
        return self.name + " --- "+self.description+"---"+self.owner.trainer.username
    
class Trainee(models.Model):
    trainee = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)
    dateOfBirth = models.DateField()
    currentWeight = models.CharField(max_length=5, null=True, blank=True)
    height = models.CharField(max_length=5)
    medicalHistory = models.BooleanField(default=False)
    trainerID = models.ForeignKey(Trainer, on_delete=models.SET_NULL, null=True)
    yogaPlan = models.ForeignKey(YogaPlan, on_delete=models.SET_NULL, null=True)
    workoutPlan = models.ForeignKey(WorkoutPlan, on_delete=models.SET_NULL, null=True)
    status = models.CharField(max_length=20, null=True)
    changedPlanStatus = models.BooleanField(default=False)
    @property
    def age(self) :
        today = date.today()
        age=today.year -self.dateOfBirth.year 
        return age



class ReportPost(models.Model):
    owner = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    num_of_reports=models.IntegerField(default=0)
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)
    

    def __str__(self):
        return f"{self.createdAt} - {self.owner}"


# comment model
class ContentValidator(RegexValidator):
    regex = r'^[a-zA-Z\s]+$'
    message = 'Invalid Comment.'

class Comment(models.Model):
    owner = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    content = models.TextField(validators=[ContentValidator()])
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)


# report comment model
class ReportComment(models.Model):
    num_of_reports=models.IntegerField(default=0)
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE)
    owner = models.ForeignKey(Trainee, on_delete=models.CASCADE)
  


class weightTracker(models.Model):
    traineeID = models.OneToOneField(Trainee, on_delete=models.SET_NULL, null=True, blank=True)
    currentWeight = models.CharField(max_length=5, null=True)
    numOfLogin = models.IntegerField(default=1)

    def save(self, *args, **kwargs):
        if self.currentWeight is None:
            self.currentWeight = self.traineeID.currentWeight
        super(weightTracker, self).save(*args, **kwargs)

class WaterTracker(models.Model):
    currentAmount = models.FloatField(default=0)
    traineeID = models.OneToOneField(Trainee, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    
class WeightTrackerHistory(models.Model):
    traineeID = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    traineeWeight =  models.FloatField(default=0)
    created_at = models.DateField(auto_now_add=True)

class WaterTrackerHistory(models.Model):
    dailyAmount = models.FloatField(default=0)
    traineeID = models.ForeignKey(Trainee, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)
