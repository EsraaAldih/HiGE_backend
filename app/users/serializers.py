

from rest_framework import serializers
from rest_auth.registration.serializers import RegisterSerializer
from rest_framework.authtoken.models import Token
from  users.models import *;
from api.models import Trainee,Trainer
from django.contrib.auth import authenticate
from rest_auth.serializers import UserDetailsSerializer as DefaultUserDetailsSerializer
from rest_auth.models import TokenModel
from api.models import weightTracker,WaterTracker
from allauth.account.models import EmailAddress
class ChoicesField(serializers.ChoiceField):
  
   def to_representation(self, obj):
        if obj == '' and self.allow_blank:
            return obj
        return self._choices[obj]
    
   def to_internal_value(self, data):
        # To support inserts with the value
        if data == '' and self.allow_blank:
            return ''

        for key, val in self._choices.items():
            print("input is ",data)
            print ("accepted val ",val,"key ",key)
            if val == data:
                return key
        self.fail('invalid_choice', input=data)
        return getattr(self._choices, data)


# override registerclassmethods
class TrainerCustomRegistrationSerializer(RegisterSerializer):

    dateOfBirth=serializers.DateField()
    gender = ChoicesField(choices=Trainer.GENDER_CHOICES)
    trainer = serializers.PrimaryKeyRelatedField(read_only=True,) #by default allow_null = False
    phoneNumber = serializers.CharField(max_length=11,required=True)
    address = serializers.CharField(required=True)
    image=serializers.ImageField(max_length=None, allow_empty_file=False, use_url=False)
    
    
    def get_cleaned_data(self):
            data = super().get_cleaned_data()
            extra_data = {
                'gender':self.validated_data.get('gender', ''),
                'dateOfBirth':self.validated_data.get('dateOfBirth', ''),
                'phoneNumber' : self.validated_data.get('phoneNumber', ''),
                'address' : self.validated_data.get('address', ''),
                'image': self.validated_data.get('image', ''),
           
            }
            data.update(extra_data)
            return data

    def save(self, request):
        user = super().save(request)
        user.is_staff = True
        user.is_active=True
        user.save()
        trainer = Trainer(trainer=user, 
                gender=self.cleaned_data.get('gender'),
                phoneNumber=self.cleaned_data.get('phoneNumber'), 
                address=self.cleaned_data.get('address'),
                image=self.cleaned_data.get('image'),
                dateOfBirth=self.cleaned_data.get('dateOfBirth'))
        trainer.save()
        return user

class TraineeCustomRegistrationSerializer(RegisterSerializer):

    dateOfBirth=serializers.DateField(required=True)
    trainee = serializers.PrimaryKeyRelatedField(read_only=True,) #by default allow_null = False
    # initialWeight = serializers.CharField(max_length=5)
    currentWeight = serializers.CharField(max_length=5)
    height = serializers.CharField(max_length=5)
    # status = serializers.CharField(max_length=20)
    medicalHistory = serializers.BooleanField(required=True)
   
    
   
    def get_cleaned_data(self):
            data = super().get_cleaned_data()
            extra_data = {
                'dateOfBirth':self.validated_data.get('dateOfBirth', ''),
                # 'initialWeight' : self.validated_data.get('initialWeight', ''),
                'currentWeight' : self.validated_data.get('currentWeight', ''),
                'height': self.validated_data.get('height', ''),
                # 'status': self.validated_data.get('status', ''),
                'medicalHistory': self.validated_data.get('medicalHistory', ''),
                
            }
            data.update(extra_data)
            return data

    def save(self, request):
        user = super().save(request)
        user.is_staff =False
        user.is_active=True
        trainee = Trainee(
                trainee=user, 
                # initialWeight=self.cleaned_data.get('initialWeight'), 
                currentWeight=self.cleaned_data.get('currentWeight'),
                height=self.cleaned_data.get('height'),
                dateOfBirth=self.cleaned_data.get('dateOfBirth'),
                # status=self.cleaned_data['status'],
                medicalHistory=self.cleaned_data['medicalHistory'],
                )
        
        user.save()
        trainee.save()
        traineeWeight=weightTracker(
           traineeID_id=trainee.id,
           currentWeight =trainee.currentWeight
        )
        traineeWater=WaterTracker(
            traineeID_id =trainee.id,
            currentAmount =0,
            
        )
        traineeWeight.save()
        traineeWater.save()
        return user

####################################################################
class LoginUserSerializer(serializers.Serializer):
    email = serializers.CharField()
    password = serializers.CharField(
        style={'input_type': 'password'}, trim_whitespace=False)

    def validate(self, attrs):
        email = attrs.get('email')
        password = attrs.get('password')
        print('email ',email," --- password",password)
   
        
        if email and password:
            if NewUser.objects.filter(email=email).exists():
                   if (EmailAddress.objects.get(email=email)).verified==False :
                    print("email is not verified ")
                    msg = {'detail': 'This email is not verified',
                        'register': True}
                    raise serializers.ValidationError(msg)
                   else :
                        user = authenticate(request=self.context.get('request'),
                                            email=email, password=password)
             
            else:
                print("not registered user ")
                msg = {'detail': 'This email is not registered',
                       'register': False}
                raise serializers.ValidationError(msg)

            if not user:
                msg = {
                    'detail': 'Unable to log in with provided credentials.', 'register': True}
                raise serializers.ValidationError(msg, code='authorization')

        else:
            msg = 'Must include "email" and "password".'
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs
####################################################
class DefaultUserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewUser
        fields = ('id', 'email','is_staff','username')

class CustomTokenSerializer(serializers.ModelSerializer):
    user = DefaultUserDetailsSerializer(read_only=True)
    
    class Meta:
        model = TokenModel
        fields = ('key', 'user', )


