import datetime
from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
from django.core.validators import MaxValueValidator, MinValueValidator

def upload_to(instance, filename):
    return 'yogaexercises/{filename}'.format(filename=filename)
class Users(models.Model):
    email = models.EmailField(max_length=30, unique=True)
    password = models.CharField(max_length=20, default='pass')
    is_staff = models.BooleanField(default=False)
    def __str__(self):
        return self.email

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


class Trainer(models.Model):
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
    )
    fullname = models.CharField(max_length=30)
    password = models.CharField(max_length=20, default='pass')
    Email = models.EmailField(max_length=30, unique=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    phoneNumber = models.CharField(max_length=11)
    birthdate = models.DateField(null=True)
    addres = models.TextField()
    image = models.ImageField(upload_to='profile/', default='None/no-img.jpg')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.fullname


class Post(models.Model):
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE)
    text = models.TextField()
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.createdAt } - {self.owner}"


# yoga plan model
class YogaPlan(models.Model):
    name = models.CharField(max_length=50)
    description= models.CharField(max_length=70 , null=True)
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE,default=1)
    exercises = models.ManyToManyField(YogaExercise, blank=True)
    image = models.ImageField(upload_to='media/')
    status = models.BooleanField(default=False)
    createdAt = models.DateTimeField(auto_now_add=True)

    @property
    def totalDuration (self):
        sum=0
        for i in self.exercises.values():
            sum+=i.get('duration')
        return sum

    @property
    def numberOfExercises (self):
        sum=0
        for i in self.exercises.values():
            sum+=1
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
    exercise = models.ManyToManyField(WorkoutExcercise, null=True,  blank=True)
    owner = models.ForeignKey(Trainer, on_delete=models.CASCADE ,default=1)
    image = models.ImageField(upload_to='images/', default='None/no-img.jpg')
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    @property
    def totalTimeOfExercises (self):
        sum=0
        for i in self.exercise.values():
            sum+=i.get('duration')
        return sum

    @property
    def numberOfEexercises (self):
        sum=0
        for i in self.exercise.values():
            sum+=1
        return sum



class Trainee(models.Model):
    fullName = models.CharField(max_length=30)
    age = models.IntegerField()
    initialWeight = models.CharField(max_length=5)
    currentWeight = models.CharField(max_length=5, null=True)
    email = models.EmailField(max_length=30)
    password = models.CharField(max_length=20)
    confirmPassword = models.CharField(max_length=20)
    height = models.CharField(max_length=5)
    medicalHistory = models.BooleanField(default=False)
    trainerID = models.ForeignKey(Trainer, on_delete=models.CASCADE)
    yogaPlan = models.ForeignKey(YogaPlan, on_delete=models.CASCADE)
    workoutPlan = models.ForeignKey(WorkoutPlan, on_delete=models.CASCADE)
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=20, null=True)

    def getDate(self):
        time = datetime.now()
        if self.createdAt.day == time.day:
            return str(time.hour - self.createdAt.hour) + " hours ago"
        if self.createdAt.month == time.month:
            return str(time.day - self.createdAt.day) + " days ago"
        else:
            if self.createdAt.year == time.year:
                return str(time.month - self.createdAt.month) + " months ago"

        return self.createdAt

    def __str__(self):
        return self.email
    
class ReportPost(models.Model):
    owner = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    text = models.TextField()
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.createdAt } - {self.owner}"
    
    

 # comment model


class Comment(models.Model):
    owner = models.ForeignKey(Trainee , on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    content = models.TextField()
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)


# report comment model
class ReportComment(models.Model):
    content = models.TextField()
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE)


class weightTracker(models.Model):
    currentWeight = models.CharField(max_length=5, null=True)
    #status = models.BooleanField(default=False)
    traineeID = models.ForeignKey(Trainee, on_delete=models.SET_NULL, null=True)

    @property
    def weightStatus(self):
        for i in self.traineeID.values():
            if i.get('initialWeight') > self.currentWeight:
                status = True
        return status