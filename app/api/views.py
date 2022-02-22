import json
from django.http import JsonResponse
from django.shortcuts import render
from rest_framework import routers, serializers, viewsets
# django User
from django.contrib.auth.models import User

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

from .models import *
from .serializers import *

from rest_auth.views import LoginView, APIView
from rest_framework.permissions import *
# Create your views here.
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.permissions import *
from rest_framework.authentication import *
from django.core import serializers


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
            print("user hitsme ", self.request.user, " --- ",
                  self.request.user.is_authenticated)
        else:
            print("this user isn't")
            body = self.request.data
        return serializer.save(owner=Trainer.objects.get(trainer_id=self.request.user.id))


class ReportPostViewSet(viewsets.ModelViewSet):
    queryset = ReportPost.objects.all().order_by('id')
    serializer_class = ReportPostSerializer


class WorkoutPlanViewSet(viewsets.ModelViewSet):
    queryset = WorkoutPlan.objects.all()
    serializer_class = WorkoutPlanSerializer


# yoga plans view
class YogaPlanViewSet(viewsets.ModelViewSet):
    queryset = YogaPlan.objects.all().order_by('id')
    serializer_class = YogaPlanSerializer


# comments view
class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all().order_by('id')
    serializer_class = CommentSerializer
    myuser = {}
    authentication_classes = (SessionAuthentication, TokenAuthentication)
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        if self.request.user.is_authenticated:
            print("user hitsme ", self.request.user, " --- ",
                  self.request.user.is_authenticated)
        else:
            print("this user isn't")
            body = self.request.data

            print(body)
            # myuser=
        return serializer.save(owner=Trainee.objects.get(trainee_id=self.request.user.id), post_id=1)

# report comments view


class ReportCommentViewSet(viewsets.ModelViewSet):
    queryset = ReportComment.objects.all().order_by('id')
    serializer_class = ReportCommentSerializer


class WorkoutExViewSet(viewsets.ModelViewSet):
    queryset = WorkoutExcercise.objects.all().order_by('id')
    serializer_class = WorkoutExSerializer


class weightViewSet(viewsets.ModelViewSet):
    queryset = weightTracker.objects.all().order_by('id')
    serializer_class = weightSerialzer


@api_view()
def null_view(request):
    return Response(status=status.HTTP_400_BAD_REQUEST)


# class getTraineeFavouritePlans(APIView):
#     permission_classes = [IsAuthenticated]
#     def get(self,request,*args,**kwargs):
#         print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
#         owner=Trainee.objects.get(trainee_id=self.request.user.id)
#         try:
#             myYogaPlan=YogaPlan.objects.filter(pk=owner.yogaPlan.id).first()
#         except:
#             myYogaPlan={}
#         try:
#              myWorkoutPlan=WorkoutPlan.objects.filter(pk=owner.workoutPlan.id).first()
#         except:
#             myWorkoutPlan={}
#         tmpJson = serializers.serialize("json",{myYogaPlan,myWorkoutPlan})
#         tmpObj = json.loads(tmpJson)


#         return  JsonResponse({'result':tmpJson}, status=200)

# get trainee yoga plan
class getTraineeFavYogaPlan (APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        print("test ", self.request.user.is_authenticated,
              self.request.user.is_staff)
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            myYogaPlan = YogaPlan.objects.filter(pk=owner.yogaPlan.id).first()
            tmpJson = serializers.serialize("json", {myYogaPlan})
            tmpObj = json.loads(tmpJson)
            return JsonResponse({'result': tmpJson}, status=200)
        except:
            myYogaPlan = {}
            return JsonResponse({'result': "yoga isn't chosen yet"}, status=200)

# get trainee workout plan


class getTraineeFavWorkoutPlan (APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        print("test ", self.request.user.is_authenticated,
              self.request.user.is_staff)
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            myWorkoutPlan = WorkoutPlan.objects.filter(
                pk=owner.workoutPlan.id).first()
            tmpJson = serializers.serialize("json", {myWorkoutPlan})
            tmpObj = json.loads(tmpJson)
            return JsonResponse({'result': tmpJson}, status=200)
        except:
            myYogaPlan = {}
            return JsonResponse({'result': "workout isn't chosen yet"}, status=200)


class addFavYogaPlan(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, *args, **kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        planId = body['id']
        print("yoga id ", planId)
        try:
            owner.yogaPlan_id = planId
            owner.save()
            return JsonResponse({'errors': "yoga plan is added"}, status=200)
        except:
            return JsonResponse({'errors': "this plan doesn't exist"}, status=200)


class addFavWorkoutPlan(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, *args, **kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        planId = body['id']
        print("yoga id ", planId)
        try:
            owner.workoutPlan_id = planId
            owner.save()
            return JsonResponse({'errors': "workout plan is added"}, status=200)
        except:
            return JsonResponse({'errors': "this plan doesn't exist"}, status=200)


class deleteFavYogaPlan (APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
       
        try:
            owner.yogaPlan_id = None
            owner.save()
            print(owner.yogaPlan_id)
            return JsonResponse({'result': "deleted sucess"}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)


class deleteFavWorkoutPlan (APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
       
        try:
            owner.workoutPlan_id = None
            owner.save()
            print(owner.workoutPlan_id)
            return JsonResponse({'result': "deleted sucess"}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)