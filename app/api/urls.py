from django.urls import path, include
from rest_framework import routers
from .views import*


router = routers.DefaultRouter()
router.register(r'yogaexercises', YogaExerciseViewSet)
router.register(r'workoutplans', WorkoutPlanViewSet)
router.register(r'posts', PostViewSet)
router.register(r'postreports', ReportPostViewSet)
router.register(r'yogaplans', YogaPlanViewSet)
router.register(r'comments', CommentViewSet)
router.register(r'commentreports', ReportCommentViewSet)
router.register(r'workoutexersices', WorkoutExViewSet)
<<<<<<< HEAD


=======
router.register(r'weight', weightViewSet)
router.register(r'water', WaterTrackerViewSet)
>>>>>>> 1b9029491068e3fd5b65a63b0c5f2daeda3cd89e

urlpatterns = [

    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('yogafavplan/',getTraineeFavYogaPlan.as_view()),
    path('workoutfavplan/',getTraineeFavWorkoutPlan .as_view()),
    path('addYogaPlan/',addYogaPlan.as_view()),
    path('addWorkoutPlan/',addWorkoutPlan.as_view()),
<<<<<<< HEAD
    path('TraineeCurrentWeight/',TraineeCurrentWeight.as_view()),
=======
>>>>>>> 1b9029491068e3fd5b65a63b0c5f2daeda3cd89e
]