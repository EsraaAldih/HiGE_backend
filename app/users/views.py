import json
from django.shortcuts import redirect, render
from django.urls import reverse
from .serializers import *
from rest_auth.registration.views import RegisterView
from rest_framework.response import Response
from rest_auth.views import LoginView ,APIView
from django.contrib.auth import login
from rest_framework.permissions import *
from django.core import serializers
# for emails
from django.core.mail import send_mail
from rest_framework.permissions import AllowAny
from allauth.account.views import ConfirmEmailView
from django.http import HttpResponseRedirect, JsonResponse
from allauth.account.models import EmailAddress
from django.conf import settings
# Create your views here.
class TrainerRegistrationView(RegisterView):
    serializer_class = TrainerCustomRegistrationSerializer
    
class TraineeRegistrationView(RegisterView):
    serializer_class = TraineeCustomRegistrationSerializer


class Login(LoginView):
    permission_classes = [AllowAny]
    def post(self, request, *args, **kwargs):
        serializer = LoginUserSerializer(data=request.data)
        print("logied in user",request.user.id)
        #print('statsus ',EmailAddress.objects.get(user_id=request.user.id).verified )
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




class TrainerDetail(APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test",request.user)
        trainer=Trainer.objects.filter(trainer_id=request.user.id).first()
        print("sffffffffffffff",trainer.address,"--  ",trainer.age)
        tmpJson = serializers.serialize("json",{trainer})
        tmpObj = json.loads(tmpJson)
        print(tmpObj)
        return Response ({'trainer':tmpObj,'age':trainer.age})

class TraineeDetail(APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test",request.user)
        trainee=Trainee.objects.filter(trainee_id=request.user.id).first()
        print("sffffffffffffff","--  ",trainee.age)
        tmpJson = serializers.serialize("json",{trainee})
        tmpObj = json.loads(tmpJson)
        return Response ({'trainee':tmpObj,'username':request.user.username,'age':trainee.age})

# for emails
class joinUs(APIView):
    permission_classes = [AllowAny]
    def post(self,request,*args,**kwargs):
        print("test",request.user)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        userName = body['name']
        email = body['email']
        content = body['content']
        text="user name  "+userName+" sender email "+email+" --- "+content
        send_mail(
         'Join Us',text,settings.DEFAULT_FROM_EMAIL,[settings.DEFAULT_FROM_EMAIL]
        )

        return Response ("email is sent successfully",status=200)

class reportIssue(APIView):
    permission_classes = [IsAuthenticated]
    def post(self,request,*args,**kwargs):
        print("test",request.user)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        content= body['content']
        s_email = self.request.user.email
        text="sender email "+s_email+" --- "+content
        send_mail(
         'reportIssue',text,settings.DEFAULT_FROM_EMAIL,[settings.DEFAULT_FROM_EMAIL]
        )
        return Response ("email is sent successfully",status=200)

class editTrainerProfile(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request,*args,**kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        trainer=Trainer.objects.get(trainer_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        phoneNumber = body['phoneNumber']
        address = body['address']
        try:
            trainer.phoneNumber=phoneNumber
            trainer.address=address
            trainer.save()
            return JsonResponse({'result':"profile data updated "}, status=200)
        except:
            return JsonResponse({'error':"something went wrong"}, status=200)    
        
        
class CustomConfirmEmailView(ConfirmEmailView):
    print('come here ')
    def get(self, *args, **kwargs):
        try:
            self.object = self.get_object()
        except Http404:
            self.object = None
        user = NewUser.objects.get(email=self.object.email_address.email)
        redirect_url = reverse('user', args=(user.id,))
        return redirect(redirect_url)
    
# class getTraineeDetailsForTrainerViewSet(APIView):
    