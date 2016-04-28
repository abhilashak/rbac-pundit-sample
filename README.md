# rbac-pundit-sample
RBAC with Pundit Gem with ability to change permission dynamically

STEPS:

   $ rake db:create -t

   $ rake db:migrate -t

   $ rake db:seed -t

Seed will populate One Admin User, One participant User and a Post data

User Data Sample:

   [

    [0] #<Admin:0x007f4fd2ea46c8> {

                 :id => 1,

         :first_name => "System Admin",

          :last_name => "",

          :client_id => nil,

          :in_active => false,

               :type => "Admin",

        :permissions => {

            "Post" => "[\"create\", \"read\", \"update\", \"destroy\"]"

        },

         :created_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00,

         :updated_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00

    },

    [1] #<Participant:0x007f4fd2550428> {

                 :id => 2,
         :first_name => "John",

          :last_name => "",

          :client_id => nil,

          :in_active => false,

               :type => "Participant",

        :permissions => {

            "Post" => "[\"read\"]"

        },

         :created_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00,

         :updated_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00

    }

   ]


Post Data:

   [

    [0] #<Post:0x007f4fd59655b0> {

                 :id => 1,

              :title => "Install Rails",

        :description => nil,

          :author_id => nil,

         :created_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00,

         :updated_at => Wed, 27 Apr 2016 18:18:59 UTC +00:00

    }

   ]

Note: Using postgres hstore to store permissions
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

View all permissions:
 
   GET http://localhost:3000/users/permissions?user_id=1

Example Response:

   [
     {"User":"System Admin","Type":"Admin","Permissions":{"Post":"[\"create\", \"read\", \"update\", \"destroy\"]"}},
     
     {"User":"John","Type":"Participant","Permissions":{"Post":"[\"read\"]"}}
   ]

Check Permission of one User:

   GET http://localhost:3000/users/permissions/2?user_id=1

Example Response:

   {"User":"John","Type":"Participant","Permissions":{"Post":"[\"read\"]"}}

Modify Permissions Example

   PUT http://localhost:3000/users/permissions/2

   body:
   
      user_id: 1
      model: Post
      operation: create
      value: true

Sample Response:

   {"User":"John","Type":"Participant","Permissions":{"Post":["read","create"]}}



