"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include,re_path
from django.conf.urls import url
from django.conf import settings  # add this
from django.conf.urls.static import static  # add this
from api.views import null_view
from rest_auth.registration.views import VerifyEmailView
from rest_auth.views import PasswordResetView, PasswordResetConfirmView
from users.views import CustomConfirmEmailView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('api.urls')),
    path('api-auth/', include('rest_framework.urls')),
    path('rest-auth/', include('rest_auth.urls')),

    path('rest-auth/registration/', include('rest_auth.registration.urls')),
  
    url(r'^verify-email/$', VerifyEmailView.as_view(), name='account_email_verification_sent'),
#    url('^rest-auth/registration/account-confirm-email/(?P<key>\w+)/$', CustomConfirmEmailView.as_view(), name='account_confirm_email'),
    # url(r'^rest-auth/registration/account-confirm-email/(?P<key>\w+)/$', allauthemailconfirmation, name="account_confirm_email"),
    re_path('rest-auth/registration/account-confirm-email/(?P<key>.+)/', CustomConfirmEmailView.as_view(), name='account_confirm_email'),
    re_path(r'^rest-auth/password/reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,40})/$', PasswordResetView.as_view(), name='password_reset'),
   # path('rest-auth/password/reset/confirm/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
   path('rest-auth/password/reset/confirm/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
   path('users/', include('users.urls')),
    url(r'^accounts/', include('allauth.urls')),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
