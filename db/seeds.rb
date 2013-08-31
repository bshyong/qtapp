# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.find_or_create_by_name("admin")
user = User.find_or_create_by_email :name => "User One", :email => "user@example.com", :password => "changeme", :password_confirmation => "changeme"
user.add_role :admin

puts "Created ADMIN user with email: user@example.com"
puts "and password: changeme"

