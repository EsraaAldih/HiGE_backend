from django.contrib import admin
from django.urls import path,include
from .views import *
urlpatterns = [

path('registration/trainer/', TrainerRegistrationView.as_view()),
path('registration/trainee/', TraineeRegistrationView.as_view()),
path('login/', Login.as_view()),
path('me/', UserDetail.as_view()),

    
]
