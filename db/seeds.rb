# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all Sessions"
Session.destroy_all

puts "Destroy all Activities"
Activity.destroy_all

puts "Destroy all Users"
User.destroy_all

puts ">>>>>> Done!"
puts "----------"

puts "Create Activities"
a1 = Activity.create!(name: "Surf")
a2 = Activity.create!(name: "Ski")
a3 = Activity.create!(name: "VTT")
a4 = Activity.create!(name: "Kayak")
a5 = Activity.create!(name: "Snowboard")
a6 = Activity.create!(name: "Kite-surf")
puts ">>>>>> Done, #{Activity.count} activities created!"
puts "----------"

puts "Create Users"
u1 = User.create!(email: "user1@gmail.com", password: 123456, username: "Tom")
u2 = User.create!(email: "user2@gmail.com", password: 123456, username: "Kelly")
u3 = User.create!(email: "user3@gmail.com", password: 123456, username: "Jordy")
u4 = User.create!(email: "user4@gmail.com", password: 123456, username: "Mick")
u5 = User.create!(email: "user5@gmail.com", password: 123456, username: "Andy")
u6 = User.create!(email: "user6@gmail.com", password: 123456, username: "Candid")
puts ">>>>>> Done, #{User.count} users created!"
puts "----------"

puts "Create Sessions"
s1 = Session.new(location: "Basque Country", start_time: Date.today, capacity: 3, title: "Maxi Sess", description: "Alright guys! Who's in for this one?", level: 'expert')
s1.activity= a1

se1a = SessionUser.new(owner: true)
se1a.session = s1
se1a.user = u1

se1b = SessionUser.new(owner: false)
se1b.session = s1
se1b.user = u2

se1c = SessionUser.new(owner: false)
se1c.session = s1
se1c.user = u3

s1.save!
puts "Session1 ok"

s2 = Session.new(location: "Basque Country", start_time: Date.today, capacity: 3, title: "Ski Paradise", description: "Conditions are awesome! Let's go!", level: 'intermediate')
s2.activity = a2

se2a = SessionUser.new(owner: true)
se2a.session = s2
se2a.user = u6

se2a = SessionUser.new(owner: false)
se2a.session = s2
se2a.user = u5

se2a = SessionUser.new(owner: false)
se2a.session = s2
se2a.user = u4

s2.save!
puts "Session2 ok"

s3 = Session.new(location: "Basque Country", start_time: Date.today, capacity: 4, title: "Bike Mountain with friends", description: "Who's motivated to hit the road again?", level: 'intermediate')
s3.activity = a3

se3a = SessionUser.new(owner: true)
se3a.session = s3
se3a.user = u6

se3a = SessionUser.new(owner: false)
se3a.session = s3
se3a.user = u5

se3a = SessionUser.new(owner: false)
se3a.session = s3
se3a.user = u4

s3.save!
puts "Session3 ok"

s4 = Session.new(location: "Basque Country", start_time: Date.today, capacity: 2, title: "Surf with friends", description: "Really motivated for this morning session!", level: 'beginner')
s4.activity = a4

se4a = SessionUser.new(owner: true)
se4a.session = s4
se4a.user = u2

se4a = SessionUser.new(owner: false)
se4a.session = s4
se4a.user = u3

se4a = SessionUser.new(owner: false)
se4a.session = s4
se4a.user = u4

s4.save!
puts "Session4 ok"
puts ">>>>>> Done, #{Session.count} sessions created!"
