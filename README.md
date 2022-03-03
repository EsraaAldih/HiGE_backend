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
- Our App provides Community Section for our registered users to allow trainers to share healthy tips and knowledge aganist healthy lifestyle mistakes.

 ## Functionalities In Depth
 - HIGE App backend is implemented using Django Framework,Django-rest for building end points and Django rest-auth for managing users registration and authentication .
 - By customizing rest-auth login serializer HiGE uses email instead of username(rest-auth default) for loggin in .
 - HIGE App uses SendGrid (cloud-based SMTP provider) to send emails (verification emails or else).
 - By customizing Django User Model authenticated Users of the sytems are divided into 2 categories 
     1.  trainee (female)
         - trainee has the privilidges to 
            - register , required data for registeration (email, username, current weight, age,medical history (boolean field))
            - login , required data for logging in (email , password)
            - reset password by provideing email then after checking this email trainee will be redirected to a form to reset her password
        -
     2.  trainer 
         - if a trainer chooses to join our teams he/she needs to send us an email via join us form ,after checking his/her identity he/she will the
               have the credentials to login .
         - trainer has the privilidges to 
             - login , required data for logging in (email , password)
             - reset password by provideing email then after checking this email trainee will be redirected to a form to reset her password
              
          














## Future Work
- Add Billing Methods
