from django.urls import path, include
from django.contrib.auth.models import User
from rest_framework import serializers
from .models import *




class YogaExerciseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = YogaExercise
        fields = ('id', 'name', 'details', 'duration','image')


class PostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Post
        fields = ('id', 'text')


class ReportPostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ReportPost
        fields = ('id', 'text')


class WorkoutPlanSerializer(serializers.HyperlinkedModelSerializer):
    exercise = serializers.SlugRelatedField(
        many=True,
        slug_field='name',
        queryset=WorkoutExcercise.objects.all()
     )
    class Meta:
        model = WorkoutPlan
        fields = ['id', 'name', 'numberOfEexercises',
                  'totalTimeOfExercises','exercise', 'status', 'image']


# yoga plan serializer
class UsersSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Users
        fields = ['email','password', 'is_staff']


# yoga plan serializer
class YogaPlanSerializer(serializers.HyperlinkedModelSerializer):
    exercises = serializers.SlugRelatedField(
        many=True,
        slug_field= 'name',
        queryset=YogaExercise.objects.all()
     )
    class Meta:
        model = YogaPlan
        fields = ('id','name','description','numberOfExercises', 'createdAt', 'image','exercises','totalDuration')


# comment serializer
class CommentSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Comment
        fields = ('id', 'content', 'createdAt',
                  'updatedAt')


# report comment serializer
class ReportCommentSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ReportComment
        fields = ('id', 'content')
        
        
class TraineeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Trainee
        fields = ['id','age','fullName', 'age', 'initialWeight','email', 'password' , 'confirmPassword' , 'height' ,'medicalHistory']
        
        

class WorkoutExSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = WorkoutExcercise
        fields = ['id','name','duration','description','gif']

class weightSerialzer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = weightTracker
        fields = ['id','traineeID','currentWeight','weightStatus']