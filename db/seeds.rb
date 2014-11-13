# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create users (roles not implemented yet, MUST be chosen from roles_list)
user_list = [
  ['jwm@johnwmount.com', 'password'],
  ['tgodino@icloud.com', 'password']
  ]

user_list.each do |email, password|  
  user = AdminUser.where( email: email )
  if user[0] == nil
  	AdminUser.create( email: email, password: password, password_confirmation: password)
  end
end
