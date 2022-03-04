# HIGE Female Fitness App (backend part)

## Table of Contents

1. Description
2. Functionalities In Depth
3. File Structure
4. Instructions
5. Running
6. Future Wrok
## Description
- The graduation project for ITI .
- Our App provides the core functionalities to help females keeping healthy and fit.Using one App registered user as trainee can choose plans for workout and yoga   ,these plans are categorized according to difficulty level ( beginner , intermediate , hard) and if user inputs she has mediacal history,the app will suggest
  choosing beginner level plans or following up with private trainer .
- A registered user as trainee can weekly keep track of her weight by inputting her weight each week and getting a monthly report of her progress .
- A registered user as trainee can daily keep track of water amount she drinks by notifying her to drink 1/2 L each 3 hours .Depending on the amount of water she drinks per day she will get a weekly report of her progress.
- A registered user as trainee can input her own plans in todo list .
- Registered user as trainee can choose to have a private trainer from our participated trainers to follow up with them in case they need further personal guidance.
- Our App provides Community Section for our registered users to allow trainers to share healthy tips and awareness against healthy lifestyle mistakes.

 ## Functionalities In Depth
 - HIGE App backend is implemented using Django Framework,Django-rest for building end points ,Django rest-auth for managing users registration and authentication and Postgres as a database.
 - By customizing rest-auth login serializer HIGE App uses email instead of username (rest-auth default) for logging in .
 - HIGE App uses SendGrid (cloud-based SMTP provider) to send emails (verification emails or else).
 - HIGE App uses postgres pg-agent for scheduling certain tasks related to water and weight tracking .
 - By customizing Django User Model authenticated Users of the sytems are divided into 2 categories 
     1.  trainee (female)
         - trainee has the privilidges to 
            - register , required data for registeration (email, username, current weight, age , medical history (boolean field))
            - login , required data for logging in (email , password)
            - reset password by providing email then after checking this email trainee will be redirected to a form to reset her password 
            - logout
            - add comments on trainers posts /delete comments /edit comments 
            - report comemnts / posts
            - report an issue
            - add a plan in todo list
            - input her weight weekly
            - inputs how much water she drinks six times per day
            - view her weekly weight and water progress report
            - choose workout and yoga plans in case of not choosing to follow up with private trainer
        -
     2.  trainer 
         - if a trainer chooses to join our teams he/she needs to send us an email via join us form ,after checking his/her identity he/she will the
               have the credentials to login .
         - trainer has the privilidges to 
            - login , required data for logging in (email , password)
            - reset password by provideing email then after checking this email trainee will be redirected to a form to reset his/her password
            - logout
            - view his/her profile data (eamil , username, date of birth ,personal image , address , phone number)
            - edit profile date ( address , phone number)
            - change his/her password
            - add and add , edit , delete s posts
            - report an issue
            - view his/her clients profile / progress
            - choose for his/her clients suitable workout and yoga plans
            
 - HIGE provides also general guidance for whoever visits the website like showing the nearest gyms,fitness clothing shops (with aid of google maps) ,what to wear while exercising and general healthy tips .
## File Structure 
- HIGE is consisting of 2 django apps , the first one USERS holds the authentication customizations ,the second one API holds the rest apis Implementations .

          - vene
          - app 
               - app 
               - api 
               - users 
               - manage.py
               - templates
                   
## Instructiosns 

- `git clone` (https://github.com/EsraaAldih/HiGE_backend.git)
- `cd` into your folder and run `python3.10 -m venv venv` to create a virtual environment ,then run `source venv/bin/activate` to activate it
- then install the followings 
   - `pip install "Django~=3.1.14"`
   - `pip install pillow`
   - `pip3 install psycopg2` => if it doesnt't work => `pip3 install psycopg2-binary`
   - `pip3 install djangorestframework`
   - `pip3 install markdown`
   - `pip3 install django-filter`
   - `pip3 install django-rest-auth[with_social]`
 - to import our database (make sure to create user in postgres and using this user create a database,use this this database in the following command)
    1. `sudo su - postgres`
    2. `psql databasename < ourdatabase.sql` 
  - visit (https://sendgrid.com/) ,make account , add a single sender and get a sceret key 
  - navigate to where settings.py is and provide your credentials (db username , db name , db username password, your single sender email and key )
  - to install postgres pg-agent 
    1. in terminal run `sudo apt-get install pgagent`
    2. `sudo su - postgres`
    3. `psql`
    4. `CREATE EXTENSION pgagent;`
    5. `CREATE LANGUAGE plpgsql;`
    6. `ALTER EXTENSION pgagent UPDATE;`
    
 ## Running 
 - navigate to where manage.py file is and run `python manage.py runserver`
 - open (http://127.0.0.1:8000/) in the browser.
      










## Future Work
- Add Free,Paid Plans and Billing Methods 
