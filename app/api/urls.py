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
router.register(r'weight', weightViewSet)

urlpatterns = [

    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('yogafavplan/',getTraineeFavYogaPlan.as_view()),
    path('workoutfavplan/',getTraineeFavWorkoutPlan .as_view()),
    path('addYogaPlan/',addYogaPlan.as_view()),
    path('addWorkoutPlan/',addWorkoutPlan.as_view()),
    path('water/',WaterViewSet.as_view()),
    
]