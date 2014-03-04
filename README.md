Introduction
=========
API for exercise 1 created by Sergio Romano

Current API version = 1

All our API is accessed from http://localhost:3000/api/v1 and all  data is sent and received as JSON.


CREATING USERS
----

Our API allows you to create Users in our system by providing their name, email, password and a password_confirmation

```
POST /api/v1/users
```

####Parameters

#####Request Parameters
  - name *(type: string)* **Required**: User's name
  - email *(type: string)*    **Required**: User's email should be well-formed and unique (you can't register a user that is already registered)
  - password *(type: string)*    **Required**: User's desired password.
  - password_confirmation *(type: string)*    **Required**: User's desired password (again to confirm).

#####Response Parameters
  - id *(type: integer)*: User's unique id
  - name *(type: string)*: User's name
  - email *(type: string)*: User's email
  - authentication_token *(type: string)*: User's authentication token to use with other API calls that require authentication


####Valid Response
If all the parameters are correct and the user was created, you will get a 200 OK status header in the HTTP response and the JSON representation of the user including the users's **id** and **authentication_token**

```
HTTP/1.1 200 OK

{
"id": 1,
"name": "JohnDoe",
"email": "john@doe.com",
"authentication_token": "s3kr3t-value"
}
```

####Error Response
Sending invalid/missing fields or if the email is already taking, will result in a 422 Unprocessable Entity response
with an errors array explaining the causes

```
 HTTP/1.1 422 Unprocessable Entity

 {
   "errors": [
    "Name can't be blank"
   ]
 }
```

####To test with CURL

curl -i -X POST -H "Content-Type:application/json" -H "Accept: application/json" -d '{
"name": "John Doe",
"email": "john@doe.com",
"password": "s3kr3t",
"password_confirmation": "s3kr3t"
}
' http://localhost:3000/api/v1/users
