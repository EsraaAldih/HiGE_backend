from django.shortcuts import render
from rest_framework import routers, serializers, viewsets
# django User
from django.contrib.auth.models import User

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

from .models import *
from .serializers import *

# Create your views here.


class YogaExerciseViewSet(viewsets.ModelViewSet):
    queryset = YogaExercise.objects.all()
    serializer_class = YogaExerciseSerializer


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class ReportPostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = ReportPostSerializer


class WorkoutPlanViewSet(viewsets.ModelViewSet):
    queryset = WorkoutPlan.objects.all().order_by('id')
    serializer_class = WorkoutPlanSerializer

# yoga plans view
class YogaPlanViewSet(viewsets.ModelViewSet):
    queryset = YogaPlan.objects.all().order_by('id')
    serializer_class = YogaPlanSerializer


# comments view
class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


# report comments view
class ReportCommentViewSet(viewsets.ModelViewSet):
    queryset = ReportComment.objects.all()
    serializer_class = ReportCommentSerializer
       


class WorkoutExViewSet(viewsets.ModelViewSet):
    queryset = WorkoutExcercise.objects.all()
    serializer_class = WorkoutExSerializer
    
class TraineeViewSet(viewsets.ModelViewSet):
    queryset = Trainee.objects.all()
    serializer_class = TraineeSerializer
    
    
class UsersViewSet(viewsets.ModelViewSet):
    queryset = Trainee.objects.all()
    serializer_class = UsersSerializer

class weightViewSet(viewsets.ModelViewSet):
    queryset = weightTracker.objects.all().order_by('id')
    serializer_class = weightSerialzer