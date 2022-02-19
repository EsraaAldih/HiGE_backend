import json
from django.shortcuts import render
from rest_framework import routers, serializers, viewsets
# django User
from django.contrib.auth.models import User

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

from .models import *
from .serializers import *

from rest_auth.views import LoginView ,APIView
from rest_framework.permissions import *
# Create your views here.
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.permissions import *
from rest_framework.authentication import *


class YogaExerciseViewSet(viewsets.ModelViewSet):
    queryset = YogaExercise.objects.all().order_by('id')
    serializer_class = YogaExerciseSerializer


class PostViewSet(viewsets.ModelViewSet):
    print('hereeeeeeeeeeeeeeeeeeeeeeee')
    queryset = Post.objects.all().order_by('id')
    serializer_class = PostSerializer
    authentication_classes = (SessionAuthentication, TokenAuthentication)
    permission_classes = [IsAuthenticated]
    def perform_create(self, serializer):
        if self.request.user.is_authenticated:
         print("user hitsme ",self.request.user," --- ",self.request.user.is_authenticated)
        else :
            print("this user isn't")
            body = self.request.data
        return serializer.save(owner=Trainer.objects.get(trainer_id=self.request.user.id))






class ReportPostViewSet(viewsets.ModelViewSet):
    queryset = ReportPost.objects.all().order_by('id')
    serializer_class = ReportPostSerializer


class WorkoutPlanViewSet(viewsets.ModelViewSet):
    queryset = WorkoutPlan.objects.all()
    serializer_class = WorkoutPlansSerializer


# yoga plans view
class YogaPlanViewSet(viewsets.ModelViewSet):
    queryset = YogaPlan.objects.all().order_by('id')
    serializer_class = YogaPlanSerializer


# comments view
class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all().order_by('id')
    serializer_class = CommentSerializer
    myuser={}
    authentication_classes = (SessionAuthentication, TokenAuthentication)
    permission_classes = [IsAuthenticated]
    def perform_create(self, serializer):
        if self.request.user.is_authenticated:
         print("user hitsme ",self.request.user," --- ",self.request.user.is_authenticated)
        else :
            print("this user isn't")
            body = self.request.data
           
            print(body)
            # myuser=
        return serializer.save(owner=Trainee.objects.get(trainee_id=self.request.user.id),post_id=1)

# report comments view
class ReportCommentViewSet(viewsets.ModelViewSet):
    queryset = ReportComment.objects.all().order_by('id')
    serializer_class = ReportCommentSerializer
       


class WorkoutExViewSet(viewsets.ModelViewSet):
    queryset = WorkoutExcercise.objects.all().order_by('id')
    serializer_class = WorkoutExSerializer
    
    
  
@api_view()
def null_view(request):
    return Response(status=status.HTTP_400_BAD_REQUEST)



class UserDetail(APIView):
    permission_classes = [IsAuthenticated]
    def post(self,request,*args,**kwargs):
        print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        if request.user.is_staff:
            print(Trainer.objects.get(trainer_id=request.user.id))
        # try :
        #     print("req user id is",request.user.id)
        #     #print(Trainee.objects.all())
        #     user=Trainee.objects.get(trainee_id=request.user.id)
        #     print(user)
        # except:
        #     print("not a trainee")
        return Response ({"email":request.user.email})