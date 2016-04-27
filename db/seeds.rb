# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_permissions = {'Post' => ['create', 'read', 'update', 'destroy']}
Admin.create(:first_name => 'System Admin', :permissions => admin_permissions)
puts '==== Created Admin User'

participant_permissions = {'Post' => ['read']}
Participant.create(:first_name => 'John', :permissions => participant_permissions)
puts '==== Created Participant User'

Post.create(:title => 'Install Rails')
puts '==== Created Post'
