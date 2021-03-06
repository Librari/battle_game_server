# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#dave = User.create( first_name:'Dave',
#                    last_name: 'Jones',
#                    avatar_name: 'Dr.Dave', 
#                    password:'changeme',
#                    email:'dave.jones@scc.spokane.edu',
#                    admin:true,    
#                    confirmed_at:Time.now,
#                    avatar_image: 'avatars/davejones.jpg'
#                  ) 
#puts 'MAKE SURE TO CHANGE YOUR PASSWORD IN THE CONSOLE!!!'
#
#
#10.times do |n|
#  test = User.create( first_name:'Test',
#                      last_name: 'User',
#                      avatar_name: "Test#{n}", 
#                      password:'changeme',
#                      email:"test#{n}@lockersoft.com",
#                      admin:false,
#                      confirmed_at: Time.now
#                    )
#  puts test
#  test.save!
#end

# Create the "computer" user 
user = User.create( first_name: 'Cray',
                    last_name: 'Computer',
                    avatar_name: 'Computer',
                    password: 'changeme',
                    email: 'dave@jonestribe.com',
                    admin: false,
                    confirmed_at: Time.now,
                    computer: true
                    )
puts 'MAKE SURE TO CHANGE YOUR PASSWORD IN THE CONSOLE!!!'
user.save!
puts user.inspect