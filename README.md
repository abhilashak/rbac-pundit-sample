# rbac-pundit-sample
RBAC with Pundit Gem with ability to change permission dynamically

STEPS:

$ rake db:create -t
$ rake db:migrate -t
$ rake db:seed -t

Seed will populate One Admin User, One participant User and a Post data

Request:
PUT posts/:id

Example:
PUT http://localhost:3000/posts/1
Body data: 
user_id : 1

Response: 
{
  "success": "Updated"
}

for user_id: 2
Response:
{
  "error": "Unauthorised"
}
