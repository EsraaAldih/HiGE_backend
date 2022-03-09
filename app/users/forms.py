
from pydoc import describe
import re


from django.forms import ModelForm, ValidationError
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib import messages
from .models import *
from django.core.validators import RegexValidator
from django.forms.widgets import CheckboxSelectMultiple
import datetime
from django.template.defaultfilters import slugify

regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
passwordRegex='^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,}$'
def ValidateEmail(email):
    print('herrrrrrrrrr')
    
    if(re.fullmatch(regex, email)):
        print("Valid Email")
    else :
      raise ValidationError(_("Enter valid JSON."))
        
    
class TrainerRegister(UserCreationForm):
    class Meta:
      model = NewUser 
      fields = ('username', 'password1', 'password2')
    username=forms.CharField(
        max_length=30,
        required=True,
        help_text="Length must not be less than 3",
        widget=forms.TextInput(
            attrs={
                'class': 'w-100 p-2 rounded-3 border border-1 ',
                'placeholder': 'Enter your username ',
            }
        )
    )
    password1=forms.CharField(
        required=True,
        help_text="Password must contain at least one lowercase, one uppercase , at least one digit and special character",
            widget=forms.PasswordInput(
                attrs={
                'class': 'w-100 p-2 rounded-3 border border-1 ',
                'placeholder': 'Enter your password ',
                'data-toggle': 'password',
                'id':"password" ,
                'name':"password" 
            }
        ))
   
    password2= forms.CharField(
        required=True,
        help_text="Password must contain at least one lowercase, one uppercase , at least one digit and special character",
            widget=forms.PasswordInput(
                attrs={
                'class': 'w-100 p-2 rounded-3 border border-1',
                'placeholder': 'Confirm your password ',
                'id':"password2" 
            }
        ))
    Email = forms.CharField(
        required=True,
        help_text='example@domain.com',
        widget=forms.TextInput(
            attrs={'class':'w-100 p-2 rounded-3 border border-1', 'placeholder':'Enter your email'}
        )
    )
    
    Phone_Number=forms.CharField(
        required=True,
        help_text='Enter a valid 11 digit phone number',
        widget=forms.TextInput(
            attrs={'class':'w-100 p-2 rounded-3 border border-1', 'placeholder':'Enter your phone number'}
        ),
        validators=[]
    )
    Personal_Image=forms.ImageField(
       required=True,
       help_text='jpg,jpeg,png,gif are allowed ',
    #    widget=forms.TextInput(
    #         attrs={'class':'w-100 p-2 rounded-3  form-control-sm p-2','type':"file"}
    #     )
    )
   
    Gender = forms.ChoiceField(required=True,choices=(('Female',"Female"),('Male',"Male"))
            , widget=forms.Select(attrs={'class':'bootstrap-select  btn-success m-3 p-1'}),
                               )
    
    Description=forms.CharField(
        required=True,
        max_length=100,
        widget=forms.Textarea(
            attrs={
                'class': 'w-100 p-2 rounded-3 border border-1',
                'placeholder': 'Enter your description ',
                'rows':2,
                'cols':3
            }
        )
    )
    
   
    def clean_Username(self):
        username=self.cleaned_data.get('Username')
        if len(username) <3 :
           raise forms.ValidationError("Length must not be less than 3")
        else :
            return username
    def clean_Email (self):
        email=self.cleaned_data.get('Email')
        if re.fullmatch(regex, email):
            return email
        else :
            raise forms.ValidationError("Enter a valid email")
    def clean_Phone_Number(self):
        phone=self.cleaned_data.get('Phone_Number')
        print(phone)
        if re.fullmatch('\d{11}|^$' ,phone):
            return phone
        else :
            raise forms.ValidationError("Enter a valid Phone number")
    def clean_Password1 (self):
        password1=self.cleaned_data.get('Password1')
        if re.fullmatch(passwordRegex, password1):
            return password1
        else:
            raise forms.ValidationError("Enter a valid password")
    def clean_Password2 (self):
        print ("pass1",self.cleaned_data.get('Password1'))
        password2=self.cleaned_data.get('Password2')
        if password2 == self.cleaned_data.get('Password1') :
            return password2
        else:
            raise forms.ValidationError("Password doesn't match")
        
    def clean_Description(self):
        description=self.cleaned_data.get('Description')
        print(description)
        if len(description) == 0 :
           raise forms.ValidationError("Enter your description ")
        else :
            return description
    
    def save(self, commit=True):
        instance = super(TrainerRegister, self).save(commit=False)
        print("instance",instance)
        if commit:
            instance.save()
        return instance
