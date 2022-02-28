from django.urls import path, include
from django.contrib.auth.models import User
from rest_framework import serializers
from .models import *


class YogaExerciseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = YogaExercise
        fields = ('id', 'name', 'details', 'duration', 'image')


class PostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Post
        fields = ('id', 'text','createdAt',)
        

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
        fields = ('id','name','description','numberOfEexercises','exercise','created_at', 'image','totalTimeOfExercises')



# yoga plan serializer


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
 

class WorkoutExSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = WorkoutExcercise
        fields = ['id','name','duration','description','gif']


class weightSerialzer(serializers.ModelSerializer):
    class Meta:
        model = weightTracker
        fields = ('id','currentWeight','numOfLogin')

class weightHistorySerialzer(serializers.ModelSerializer):
    class Meta:
        model = WeightTrackerHistory
        fields = ('id','traineeWeight','created_at')
        
class WaterTrackerSerializer(serializers.ModelSerializer):
    class Meta:
        model = WaterTracker
        fields = ['id','currentAmount' ,'traineeID']
        
class WaterTrackerHistortSerializer(serializers.ModelSerializer):
    class Meta:
        model = WaterTrackerHistory
        fields = ['id','dailyAmount' ,'traineeID', 'created_at']

class weightHistorySerialzer(serializers.ModelSerializer):
    class Meta:
        model = WeightTrackerHistory
        fields = ('id','traineeWeight','created_at')