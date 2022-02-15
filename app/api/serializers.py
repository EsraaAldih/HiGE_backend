from django.urls import path, include
from django.contrib.auth.models import User
from rest_framework import serializers
from .models import *




class YogaExerciseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = YogaExercise
        fields = ('name', 'details', 'duration','image','numberOfExercises')


class PostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Post
        fields = ('id', 'text')


class ReportPostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ReportPost
        fields = ('id', 'text')


class WorkoutPlanSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = WorkoutPlan
        fields = ['id', 'name', 'numberOfEexercises',
                  'totalTimeOfExercises','exercise', 'status', 'image']

# yoga plan serializer
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'is_staff']


# yoga plan serializer
class YogaPlanSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = YogaPlan
        fields = ('name','description','numberOfExercises', 'createdAt', 'image','exercises','totalDuration')


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
        fields =  ['id','birthdate','fullName', 'age', 'initialWeight','email', 'password' , 'confirmPassword' , 'height' ,'medicalHistory']
        
        
class CategorySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Category
        fields =  ['id','name']

class SubCatSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = subCategories
        fields = ['id','level']

class WorkoutExSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = WorkoutExcercise
        fields = ['id','name','duration','description','gif']