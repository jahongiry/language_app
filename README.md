# Documentation

\*\* Users
GET /api/v1/users

GET /api/v1/users/:id

POST /api/v1/users

```
{
"user": {
"email": "example@example.com",
"password": "secretpassword"
}
}
```

POST /api/v1/login

```
{
  "email": "teacher@gmail.com",
  "password": "teacher123"
}
```

PATCH/PUT /api/v1/users/:id

DELETE /api/v1/users/:id

\*\* Lessons

GET /api/v1/lessons

GET /api/v1/lessons/:id

POST /api/v1/lessons

{
"lesson": {
"index": 1,
"title": "Introduction to Ruby on Rails",
"description": "This lesson covers the basics of Ruby on Rails framework.",
"completed": false,
"score": 0
}
}

PATCH/PUT /api/v1/lessons/:id

DELETE /api/v1/lessons/:id
