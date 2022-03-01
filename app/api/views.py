import email
import json
from attr import field
from django.http import JsonResponse
from django.shortcuts import render
from rest_framework import routers, serializers, viewsets
# django User
from users.serializers import DefaultUserDetailsSerializer
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
from users.models import NewUser
class YogaExerciseViewSet(viewsets.ModelViewSet):
    queryset = YogaExercise.objects.all().order_by('id')
    serializer_class = YogaExerciseSerializer


class PostViewSet(viewsets.ModelViewSet):
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


class TraineeCurrentWeight(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)

        try:
            traineeData = (weightTracker.objects.get(traineeID_id=owner.id))
            currentID = traineeData.traineeID_id
            currentWeight = traineeData.currentWeight
            currentCounter = traineeData.numOfLogin
            return JsonResponse({'id': currentID,
                                 'weight': currentWeight,
                                 'counter': currentCounter}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)

    def put(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        cw = body['currentWeight']
        currentCounter = body['currentCounter']

        try:
            traineeWeight = weightTracker.objects.get(traineeID_id=owner.id)
            traineeWeight.currentWeight = cw
            traineeWeight.numOfLogin = currentCounter
            traineeWeight.save()
            return JsonResponse({'result': 'currentWeight is updated correctly'}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)


class TraineeWeightHistory(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            traineeHistory = list(WeightTrackerHistory.objects.filter(traineeID_id=owner.id).order_by('-created_at')[:4][::-1])
            tmpJson = serializers.serialize("json",traineeHistory)
            tmpObj = json.loads(tmpJson)
            return JsonResponse({'result': tmpObj}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)


    def post(self, request, *args, **kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        traineeID = body['id']
        cw = body['currentWeight']   
        
        try:
            traineeWeight = WeightTrackerHistory(traineeWeight=cw,traineeID_id=traineeID)
            traineeWeight.save()
            return  JsonResponse({'result':'weight added '}, status=200)
        except:
            return  JsonResponse({'result':"something went wrong"}, status=200)
    
    

@api_view()
def null_view(request):
    return Response(status=status.HTTP_400_BAD_REQUEST)


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

# get trainee yoga plan
class getTraineeFavYogaPlan (APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            myYogaPlan=YogaPlan.objects.filter(pk=owner.yogaPlan.id).first()
            tmpJson = serializers.serialize("json",{myYogaPlan})
            tmpObj = json.loads(tmpJson)
            return  JsonResponse({'result':tmpJson}, status=200)
        except:
            myYogaPlan={}
            return  JsonResponse({'result':"yoga isn't chosen yet"}, status=200)
        
# get trainee workout plan
class getTraineeFavWorkoutPlan (APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            myWorkoutPlan=WorkoutPlan.objects.filter(pk=owner.workoutPlan.id).first()
            tmpJson = serializers.serialize("json",{myWorkoutPlan})
            tmpObj = json.loads(tmpJson)
            return  JsonResponse({'result':tmpJson}, status=200)
        except:
            myYogaPlan={}
            return  JsonResponse({'result':"workout isn't chosen yet"}, status=200)
        
        
class addYogaPlan(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request,*args,**kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        planId = body['id']
        print("yoga id ",planId)
        try:
            owner.yogaPlan_id=planId
            owner.save()
            return JsonResponse({'errors':"yoga plan is added"}, status=200)
        except:
            return JsonResponse({'errors':"this plan doesn't exist"}, status=200)

class addWorkoutPlan(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request,*args,**kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        planId = body['id']
        print("yoga id ",planId)
        try:
            owner.workoutPlan_id=planId
            owner.save()
            return JsonResponse({'errors':"workout plan is added"}, status=200)
        except:
            return JsonResponse({'errors':"this plan doesn't exist"}, status=200)


class deleteWorkoutPlan(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request,*args,**kwargs):
        # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainee.objects.get(trainee_id=self.request.user.id)
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        planId = body['id']
        print("yoga id ",planId)
        try:
            owner.workoutPlan_id=planId
            owner.save()
            return JsonResponse({'errors':"workout plan is added"}, status=200)
        except:
            return JsonResponse({'errors':"this plan doesn't exist"}, status=200)
        
        
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
       


class WaterViewSet(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request,*args,**kwargs):
            # print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
            trainee=Trainee.objects.filter(trainee_id=self.request.user.id).first()
            traineeID= trainee.id
            body_unicode = request.body.decode('utf-8')
            body = json.loads(body_unicode)
            currentAmount = body['count']
            print("current Amount ",currentAmount)
            try:
                water_traker = WaterTracker.objects.get(traineeID_id=traineeID)
                water_traker.currentAmount =currentAmount
                water_traker.save()
                return JsonResponse({'result':"currentAmount is added"}, status=200)
            except:
                return JsonResponse({'errors':"currentAmount doesn't exist"}, status=400)

    
    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        print("esss",owner)
       
        try:
            # currentAmount=(weightTracker.objects.get(traineeID_id=owner.id)).currentAmount
            currentAmount=(WaterTracker.objects.filter(traineeID_id=owner.id)).first().currentAmount
            print(currentAmount)
            return JsonResponse({'result': currentAmount}, status=200)
        except:
            return JsonResponse({'result': "something went wrong"}, status=200)
    

class getTrainerPosts (APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainer.objects.get(trainer_id=self.request.user.id)
        print(owner.id)
        try:
            posts=list(Post.objects.filter(owner_id=owner.id))
            # print(posts)
            tmpJson = serializers.serialize("json",posts)
            # print(tmpJson)
            tmpObj = json.loads(tmpJson)
            return  JsonResponse({'result':tmpObj}, status=200)
        except:
            return  JsonResponse({'result':"you haven't added any post yet"}, status=200)

class getPost (APIView):
    def post(self,request,*args,**kwargs):
        
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        postId = body['id']
        print('post id ', postId)
     
        try:
            post=Post.objects.get(pk=postId)
            print("test post ",self.request.user.is_authenticated,self.request.user.is_staff)
            owner=Trainer.objects.get(pk=post.owner_id)
            user=NewUser.objects.get(pk=owner.trainer_id)
            print(owner.id)
            print(user.username)
            username=user.username
            tmpJson = serializers.serialize("json",{post})
            print(tmpJson)
            tmpObj = json.loads(tmpJson)
            return  JsonResponse({'result':tmpObj,'username':username}, status=200)
        except:
            return  JsonResponse({'result':"this post doen't exist"}, status=200)
        
        
        
class getPostComments (APIView):
    def post(self,request,*args,**kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        postId = body['id']
        print('post id for comments', postId)
     
        print("test get comments ",self.request.user.is_authenticated,self.request.user.is_staff)
       
        try:
            comments=list(Comment.objects.filter(post_id=postId))
            print(comments)
            tmpJson = serializers.serialize("json",comments)
            print("tmp ",tmpJson)
            tmpObj = json.loads(tmpJson)
            return  JsonResponse({'result':tmpObj}, status=200)
        except:
            return  JsonResponse({'result':"this post has no comments"}, status=200)
        
class addPostComment (APIView):
    def post(self,request,*args,**kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        postId = body['id']
        content = body['content']
        trainee=Trainee.objects.get(trainee_id=self.request.user.id)
        traineeID= trainee.id
        print('post id for comments', postId,content)
     
        print("test post comment ",self.request.user.is_authenticated,self.request.user.is_staff)
       
        try:
            comment=Comment(post_id=postId,content=content,owner_id=traineeID)
            comment.save()
            return  JsonResponse({'result':'comment added '}, status=200)
        except:
            return  JsonResponse({'result':"this post has no comments"}, status=200)
        
        
class WaterHistoryViewSet(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request, *args, **kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        trainee=Trainee.objects.get(trainee_id=self.request.user.id)
        traineeID= trainee.id
        dailyAmount = body['amount'] 
        print(dailyAmount,traineeID) 
        try:
            traineeAmount = WaterTrackerHistory(dailyAmount=dailyAmount,traineeID_id=traineeID)
            traineeAmount.save()
            return JsonResponse({'result':'daily Amount added '}, status=200)
        except:
            return JsonResponse({'result':"something went wrong"}, status=400)
        
    def get(self, request, *args, **kwargs):
        owner = Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            data=(WaterTrackerHistory.objects.filter(traineeID_id=owner.id)).order_by('-created_at')[:7][::-1]
            serializer = WaterTrackerHistortSerializer(data, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK) 
        except WaterTrackerHistory.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        
class getTrainerClients (APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        print("test ",self.request.user.is_authenticated,self.request.user.is_staff)
        owner=Trainer.objects.get(trainer_id=self.request.user.id)
        try:
            clients=list(Trainee.objects.filter(trainerID=owner.id))
            u = []
            for c in clients:
                usernames=list(NewUser.objects.filter(pk=c.trainee.id))
                u.extend(usernames)
            tmpJson = serializers.serialize("json",u)
            tmpObj = json.loads(tmpJson)

            return  JsonResponse({'result':tmpObj}, status=200)
        except:
            return  JsonResponse({'result':"you don't have any trainees"}, status=400)   
        
             
        #######################  Esraa ###########################
class getTraineeDetailsForTrainerViewSet(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, id=None):
        trainee=Trainee.objects.get(trainee_id=id)
        print("owneeeeeeeeeeeeeeeeeeeeeeeeeeeeer",trainee.trainee_id)
       
        try:
            traineeWorkoutPlan=WorkoutPlan.objects.filter(id=trainee.workoutPlan_id).first()
            print("wwwwwwwwwwwwwwwwwww",traineeWorkoutPlan)    
            traineeYogaPlan=YogaPlan.objects.filter(id=trainee.yogaPlan_id).first()
            print("yyyyyyyyyyyyyyyyyyy",traineeYogaPlan)    
           
            if(traineeWorkoutPlan):
                 tmpJsonWorkout = serializers.serialize("json",{traineeWorkoutPlan})
                 tmpObjWorkout = json.loads(tmpJsonWorkout)
            else:
                tmpObjWorkout="the trainee does not choies a plan yet"  
            if(traineeYogaPlan):
                 tmpJsonYoga = serializers.serialize("json",{traineeYogaPlan})
                 tmpObjYoga = json.loads(tmpJsonYoga)
            else:
                tmpObjYoga="the trainee does not choies a plan yet"  
                   
            data=(WaterTrackerHistory.objects.filter(traineeID_id=trainee.id)).order_by('-id')
            serializer = WaterTrackerHistortSerializer(data, many=True)
            if(len(data)>=7):
                data=data[:7][::-1]
                dataWater=serializer.data
            else:
                dataWater="The Water History report hasn't prepared yet....."  
                  
            traineeHistory = list(WeightTrackerHistory.objects.filter(traineeID_id=trainee.id).order_by('-id'))
            tmpJsonweight = serializers.serialize("json",traineeHistory)
            tmpObjweight = json.loads(tmpJsonweight)
            print("yakhrapaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaay",len(tmpObjweight))
            
            if(len(traineeHistory) >= 4):
                traineeHistory = traineeHistory[:4][::-1]
                tmpJsonweight = serializers.serialize("json",traineeHistory)
                tmpObjweight = json.loads(tmpJsonweight)
            else:  
                 tmpObjweight= "The Weight History report hasn't prepared yet..... " 
            

                
                 
            return JsonResponse({"water":dataWater,"workout":tmpObjWorkout,"yoga":tmpObjYoga,"weight":tmpObjweight}, status=status.HTTP_200_OK)

        except:
            return  JsonResponse({'result':"workout and yoga aren't chosen yet"}, status=400)
          

   
class TraineeInfoData(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, id=None): 
        trainee=Trainee.objects.get(trainee_id=id)
        try:
            username=NewUser.objects.filter(pk=trainee.trainee_id)  
            tmpJsonUser = serializers.serialize("json",username)         
            tmpObjUser = json.loads(tmpJsonUser)
            print("uuuuuuuuuuuuuuuuuuuuuuuuuhhh",tmpObjUser[0]['fields']['email'])
            email=tmpObjUser[0]['fields']['email']
            username=tmpObjUser[0]['fields']['username']
            return JsonResponse({"userInfo":{"email":email,"username":username,"medicalHistory":trainee.medicalHistory,"age":trainee.age}}, status=status.HTTP_200_OK)
            
        except:
            return  JsonResponse({'result':"something went Wrong"}, status=400)
   

class getTrainersFroTrainee (APIView):
    permission_classes = [IsAuthenticated]
    def get(self,request,*args,**kwargs):
        trainee=Trainee.objects.get(trainee_id=self.request.user.id)
        try:
            # clients=list(Trainee.objects.filter(trainerID=owner.id))
            trainers=list(Trainer.objects.all())
            print("ddddd",trainers)
            available_tainers = []
            for trainer in trainers:
                data=(NewUser.objects.filter(id=trainer.trainer_id)).order_by('-id')
                serializer = DefaultUserDetailsSerializer(data, many=True)
                available_tainers.extend(serializer.data)
            print("uuuuuuuuuuugggggguuuuu",available_tainers)

            return  Response({"trainers":available_tainers}, status=200)
        except:
            return  JsonResponse({'result':"you don't have any trainees"}, status=400) 
          
    def put(self,request,*args,**kwargs):
            trainee=Trainee.objects.filter(trainee_id=self.request.user.id).first()
            body_unicode = request.body.decode('utf-8')
            body = json.loads(body_unicode)
            trainerId = body['id']
            print("trainer Id ",trainerId)
            try:
                trainer=Trainer.objects.filter(trainer_id=trainerId).first()
                trainee.trainerID_id =trainer.id
                print("trainer Id ",trainer.id)
                
                trainee.save()
                return JsonResponse({'result':"trainer is added"}, status=200)
            except:
                return JsonResponse({'errors':"trainer doesn't exist"}, status=400)

        
        #######################  Esraa ###########################
      

