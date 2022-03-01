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


urlpatterns = [

    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('yogafavplan/',getTraineeFavYogaPlan.as_view()),
    path('workoutfavplan/',getTraineeFavWorkoutPlan .as_view()),
    path('deleteyogaplan/',deleteFavYogaPlan.as_view()),
    path('deleteworkoutplan/',deleteFavWorkoutPlan.as_view()),
    path('addYogaPlan/',addYogaPlan.as_view()),
    path('addWorkoutPlan/',addWorkoutPlan.as_view()),
    path('deleteFavPlan/',deleteFavYogaPlan.as_view()),
    path('water/',WaterViewSet.as_view()),
    path('getTrainerPosts/',getTrainerPosts.as_view()),
    path('getPost/',getPost.as_view()),
    path('getPostComments/',getPostComments.as_view()),
    path('addPostComment/',addPostComment.as_view()),
    path('TraineeCurrentWeight/',TraineeCurrentWeight.as_view()),
    path('TraineeWeightHistory/',TraineeWeightHistory.as_view()),
    path('dailyWater/', WaterHistoryViewSet.as_view()),
    path('getTrainerClients/', getTrainerClients.as_view()),
    path('traineeInfo/<int:id>', getTraineeDetailsForTrainerViewSet.as_view()),
    path('traineeInfoData/<int:id>', TraineeInfoData.as_view()),
    path('getTrainers/', getTrainersFroTrainee.as_view()),


]
    
    
