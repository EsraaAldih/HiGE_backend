# HIGE Female Fitness App (backend part)

## Table of Contents

1. Description
2. Functionalities In Depth
3. Instructions
4. Running
5. Important Points
6. Future Wrok
## Description
- The graduation project for ITI .
- Our App provides the core functionalities to help females keeping healthy and fit.Using one App registered user as trainee can choose plans for workout and yoga   ,these plans are categorized according to difficulty level ( beginner , intermediate , hard) and if user inputs she has mediacal history,the app will suggest
  choosing beginner level plans or following up with private trainer .
- A registered user as trainee can weekly keep track of her weight by inputing her weight each week and getting a monthly report of her progress .
- A registered user as trainee can daily keep track of water amount she drinks by notifying her to drink 1/2 L each 3 hours .Depending on the amount of water she drinks per day she will get a weekly report of her progress.
- A registered user as trainee can input her own plans in todo list .
- Registered user as trainee can choose to have a private trainer from our participated trainers to follow up with them in case they need futher personal       guidance.
- Our App provides Community Section for our registered users to allow trainers to share healthy tips and awarness aganist healthy lifestyle mistakes.

 ## Functionalities In Depth
 - HIGE App backend is implemented using Django Framework,Django-rest for building end points ,Django rest-auth for managing users registration and authentication and Postgres as a database.
 - By customizing rest-auth login serializer HIGE App uses email instead of username (rest-auth default) for loggin in .
 - HIGE App uses SendGrid (cloud-based SMTP provider) to send emails (verification emails or else).
 - HIGE App uses postgres pg-agent for scheduling certain tasks related to water and weight tracking .
 - By customizing Django User Model authenticated Users of the sytems are divided into 2 categories 
     1.  trainee (female)
         - trainee has the privilidges to 
            - register , required data for registeration (email, username, current weight, age,medical history (boolean field))
            - login , required data for logging in (email , password)
            - reset password by provideing email then after checking this email trainee will be redirected to a form to reset her password
            - logout
            - add reports comemnts
            - report an issue
            - add a plan in todo list
            - input her weight weekly
            - inputs how much water she drinks six times per day
            - view her weekly weight and water progress report
            - choose workout and yoga plan in case of not choosing to follow up with private trainer
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
            - add and reports posts 
            - add reports comemnts
            - report an issue
            - view his/her clients profile / progress
            - choose for his/her clients suitable workout and yoga plans
            
 - HIGE provides also general guidance for whoever visits the website like showing the nearest gyms,fitness clothing shops (with aid of google maps) ,what to wear while exercising and general healthy tips .
          














## Future Work
- Add Billing Methods
