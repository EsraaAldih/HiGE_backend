import json
from django.shortcuts import render
from .serializers import *
from rest_auth.registration.views import RegisterView
from rest_framework.response import Response
from rest_auth.views import LoginView ,APIView
from django.contrib.auth import login
from rest_framework.permissions import *
from django.core import serializers

# Create your views here.
class TrainerRegistrationView(RegisterView):
    serializer_class = TrainerCustomRegistrationSerializer
    
class TraineeRegistrationView(RegisterView):
    serializer_class = TraineeCustomRegistrationSerializer


class Login(LoginView):
    permission_classes = [AllowAny]
    def post(self, request, *args, **kwargs):
        serializer = LoginUserSerializer(data=request.data)
        print("logied in user",serializer)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        print("my user  ",user)
        login(request, user)
        try :
            print("req user id is",request.user.id)
            #print(Trainee.objects.all())
            user=Trainee.objects.get(trainee_id=request.user.id)
            print(user)
            request.user=user

        except:
            try:
                print("req user id is",request.user.id)
                #print(Trainee.objects.all())
                user=Trainer.objects.get(trainer_id=request.user.id)
                print(user)
                request.user=user

            except:
                print("this is not authorizied author")

        return super().post(request, format=None)




class TraineeDetail(APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test",request.user)
        trainer=Trainer.objects.filter(trainer_id=request.user.id).first()
        tmpJson = serializers.serialize("json",{trainer})
        tmpObj = json.loads(tmpJson)
        # try :
        #     print("req user id is",request.user.id)
        #     #print(Trainee.objects.all())
        #     user=Trainee.objects.get(trainee_id=request.user.id)
        #     print(user)
        # except:
        #     print("not a trainee")
        return Response ({'trainer':tmpObj})

