# BQuest

## Setup
1. Install `docker` and `docker-compose`. 
2. run `make build && make run` in the root directory (this one)
3. In another window, run `make init_db` to set up some default values for everything


## Project Organization

Simplified tree diagram
``` /usr/bin/tree
.  # Contains docker setup and Makefile
├── docker-compose.yml  # defines setup of PostgreSQL and Django
├── Dockerfile  # defines pickmybruin/backend Docker image
├── initialize.sh  # sets up Django container (runs migrations and then boots server)
├── Makefile  # contains very useful helper commands
└── src  # Contains all Django code
    ├── pickmybruin  # Contains code relating to the entire website
    │   ├── keys.py  # put confidential info in here
    │   ├── settings.py  # global settings (please keep confidential info out of here)
    │   ├── urls.py  # global URLs (usually imports app URLs too)
    └── users  # One app for just users
        ├── admin.py  # sets up /admin pages
        ├── models.py  # contains class declarations and methods
        ├── serializers.py  # contains serializers for classes 
        ├── tests.py  # necessary (pls)
        ├── urls.py  # sets up app specific URLs
        └── views.py  # sets up responses to URLs
```

## Makefile commands
- `make build` creates the `pickmybruin/backend` image
- `make run` starts up the PostgreSQL and Django containers
- `make restart` restarts the Django container (useful when you edit code)
- `make ssh` starts a bash session in the latest Django container
- `make run_command` runs a command inside the latest Django container
    - `make run_command cmd="echo hi"` will run `echo hi` inside the latest Django container
- `make shell` starts a `manage.py shell_plus` inside the latest Django container
    - If you don't know what this means, that's fine
- `make test` runs test.py use `args=--keepdb` to use previous test database

## How to add a new app
1. Run `make run_command cmd="src/manage.py startapp $APPNAME`
    - This creates a new skeleton folder for your new app
2. YOU MUST ADD THIS APP TO `src/pickmybruin/settings.py` `INSTALLED_APPS` FOR THE APP TO BE DISCOVEREDR
    - `'users',` adds the `users` app to the Django project.  Big surprise.
3. Add your code
4. Add tests to `tests.py`
5. Add your models to `admin.py`
6. Import your urls.py in `src/pickmybruin/urls.py`
7. Run the tests
8. Submit a PR

## How to do authorized requests
1. Login
  - Only the `username` and `password` fields in the input should ever change
  - Only the `access_token` field in the output really matters  
  ![Login Postman Screenshot](https://i.gyazo.com/df9680b972598d00748dc1244df3e35a.png)
2. Use the `access_token` to do requests
  - MUST BE `Authorization: Bearer <ACCESS_TOKEN>`
  - Django will automatically identify the user with the token  
  ![Authorization Postman Screenshot](https://i.gyazo.com/5ee6d2a1348bbdbf7e479d534a25ba82.png)


## API
### Create new user
  POST /users/
  ```
      {
          "email": "<EMAIL>",
          "password": "<PASSWORD>"
      }
  ```
  returns 
  ```
      {
          "id": <PROFILE_ID>,
          "user": {
            "id" : <USER_ID>,
            "first_name" : "<FIRST_NAME>",
            "last_name" : "<LAST_NAME>",
            "email" : "<EMAIL>"
          },
          "verfied" : <VERIFIED>
      }
  ```
  sends a verification email with a link:
    "https://bquest.ucladevx.com/verify?code=<VERIFICATION_CODE>" or 
    "http://localhost:8000/users/verify?code=<VERIFICATION_CODE> in development

### Verify user
  POST /verify/
  ```
      {
          "verification_code": "<VERIFICATION_CODE>"
      }
  ```
  returns  
  ```
      {
          "profile_id": <PROFILE_ID>
      }
  ```

  GET /verify_link/
  re-sends verification link
  returns  
  ```
      {
          "profile_id": <PROFILE_ID>
      }
  ```

### Login
  POST /o/token/ (login)
  ```x-www-form-urlencoded
      grant_type:password
      username:<USER_EMAIL>
      password:<USER_PASSWORD>
      client_id:web
      client_secret:<CLIENT_SECRET> // Note: the CLIENT_SECRET is a hardcoded field you need to get from your backend
  ```
  returns 
  ```
      {
          "access_token": "<ACCESS_TOKEN>",
          "expires_in": 36000,
          "token_type": "Bearer",
          "scope": "read write groups",
          "refresh_token": "<REFRESH_TOKEN>"
      }
  ```
### Authorization
  Authorization done over headers  
  Authorization: "Bearer <ACCESS_TOKEN>"

### Password
  POST /password_link (get password reset link)
  ```
      {
          "username" : <USERNAME>
      }
  ```
  returns 
  ```
      HTTPResponse 200
  ```
  sends a verification email with a link:
    "https://bquest.ucladevx.com/password?code=<PASSWORD_RESET_CODE>&username=<USERNAME>" or 
    "http://localhost:8000/users/password?code=<PASSWORD_RESET_CODE>&username=<USERNAME>" in development
  
  POST /password (reset password)
  ```
      {
          "userid" : <USERID>
          "code" : <PASSWORD_RESET_CODE>
          "password" : <NEW_PASSWORD>
      }
  ```
  returns 
  ```
      HTTPResponse 200
    
  ```
### Get own user
  GET /users/me/  
  returns
  ```
      {
          "id": "<PROFILE_ID>",
          "first_name": "<USER_FIRST_NAME>",
          "last_name": "<USER_LAST_NAME>",
          "email": "<USER_EMAIL>",
          "year": "<YEAR>",
          "verified": "<VERIFIED>",
          "picture": <PICTURE>,
          "notifications_enabled": "<NOTIFICATION_BOOL>
          "phone_number": "<PHONE_NUMBER>"
          "date_created": "<DATE_CREATED_ISO8601>"
      }
  ```

### Get specific user (Not Implemented)
  GET /users/<PROFILE_ID>/  
  return is same as /users/me/  

### Update own user
  PATCH /users/me/  
  schema is same as /users/me/, but will update subfields (don't change the id please)  
  return is same as /users/me/  

### Get own mentor
  GET /mentors/me/  
  returns  
  ```
      {
          "id": "<MENTOR_ID>",
          "profile": <PROFILE>,
          "active": "<MENTOR_STATE>",
          "major": <MAJOR>,
          "gpa": "<GPA",
          "bio": <BIO>,
          "clubs": "<CLUBS>"
          "courses": [
              <COURSES> ...
          ],
          "pros": "<PROS>",
          "cons": "<CONS>",
          "date_created": "<DATE_CREATED_ISO8601>"
      }
  ```

### Activate own mentor
  POST /mentors/me/
    - create mentor it doesn't exist
    - activate mentor if it does exist
    - will always set active to true
    - takes no params
  returns same as /mentors/me/  

### Update own mentor
  PATCH /mentors/me/  
  schema is same as /mentors/me/, but will update subfields (don't change the id please) 
  Note: Use this when setting mentor to inactive 
  Note: Format to update courses is as follows:
  ```
    {
      "courses": [
        { "name" : "<COURSE>" },
        { "name" : "<COURSE2>" }
      ]
    }
  ```
  return is same as /mentors/me/  


### Get possible majors (Not Implemented)
  GET /majors/  
  returns  
  ```
      {
          "majors": [
              <MAJORS>...
          ]
      }
  ```

### Search for mentors
  GET /mentors/?major=<MAJOR_ID>&year=<YEAR>&random=<NUM>
    - if any query_param is missing, it defaults to 'all' for that parameter
      (all params are optional)
    - random is only called when included
      (if there is not arg given, it returns all applicable mentors in a random order)
    - only returns active mentors
    - excludes yourself
    - no pagination for now
  returns   
  ```
      {
          "count": <NUMBER OF RESULTS>,
          "next": null,
          "previous": null,
          "results": [
              <MENTOR_PROFILE> ... // same as /mentor/me/ format
          ]
      }
  ```

### Get specific mentor
  GET /mentors/<MENTOR_ID>/  
  return is same as /mentors/me/  


### Send mentor a request
  POST /requests/<MENTOR_ID>/  
  ```
      {
          "phone": "<OPTIONAL_PHONE>"
          "preferred_mentee_email": "<REPLY_EMAIL>"
          "message": "<EMAIL_BODY>"
      }
  ```
  returns a Request object (seen below)

### Get all requests for user
  GET /requests/list/me/  
  returns
  ```
      {
          "count": <NUMBER_OF_REQUESTS>
          "next": null
          "prev": null
          "results": <LIST_OF_REQUESTS> [
            {
              "mentee": <MENTEE_INFO>
              "mentor": <MENTOR_INFO>
              "email_body": "<MESSAGE_FROM_MENTEE>"
              "preferred_mentee_email": "<REPLY_EMAIL>"
              "phone": "<OPTIONAL_MENTEE_PHONE>"
              "date_created": "<DATE_OF_REQUEST>"
            }
            ...
          ]
      }
  ```

### Get all threads for a user
  GET /messaging/me/
  GET /messaging/

  returns
  ```
      {
          "count": <NUMBER_OF_THREADS>
          "next": null
          "prev": null
          "results": <LIST_OF_THREADS> [
          {
            'other_profile': <DATA_OF_OTHER_PROFILE>
            'recent_message': <MOST_RECENT_MESSAGE_DATA>
            }]
      }
  ```

### Send a message
  POST /messaging/<PROFILE_ID>/  
  ```
      {
          "body": "<MESSAGE_BODY>"
      }
  ```
  returns a Message object

### Get all messages between user and someone else
  GET /messaging/<PROFILE_ID>/

  returns
  ```
      {
          "count": <NUMBER_OF_MESSAGES>
          "next": null
          "prev": null
          "results": <LIST_OF_MESSAGES> [
          {
            'id':'<MESSAGE_ID>'
            'sender':<PROFILE_OF_SENDER>
            'body':'<MESSAGE_BODY>'
            'timestamp':'TIME_SENT'
            'unread': <BOOLEAN>
            }]
      }
  ```

### Mark a thread as read
  PATCH /messaging/read/<THREAD_ID>/  
  ```
      {
          <DOESN'T MATTER>
      }
  ```
  returns the specified Thread object

### Check if a thread exists between two users
  GET /messaging/check/<PROFILE_ID>

  returns
  ```
      {
          'exists': <True/False>
      }
  ```

## Current Database Schema (Will probably be outdated soon)

### NOTE: you don't really need to understand this, but this is how Django will create tables for the models


#### User Table

id | email | first_name | last_name | (salted and hashed) password 
--- | --- | --- | --- | --- 
1 | me@marktai.com | Mark | Tai | verysecurepassword 
2 | you@marktai.com | John | Doe | corgisarecute 


#### Profile Table

id | user_id | bio 
--- | --- | --- 
1 | 1 | Let me know if these examples suck 
2 | 2 | [marktai.com/#corgis](https://www.marktai.com/#corgis) for all your corgi needs 


#### Major Table

id | name 
--- | --- 
1 | CS 


#### Mentor Table

id | profile_id | major_id | bio 
--- | --- | --- | --- 
1 | 2 | 1 | I will teach you the ways of corgis 

#### Course Table

id | name 
--- | --- 
1 | CS31 


