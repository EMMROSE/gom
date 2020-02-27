# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroy all Activities"
Activity.destroy_all

puts "Destroy all Sport Sessions"
SportSession.destroy_all

puts "Destroy all Users"
User.destroy_all

puts ">>>>>> Done!"
puts "----------"

puts "Create Activities"

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638267/surf_activity.jpg')
a1 = Activity.create!(name: "Surf")
a1.photo.attach(io: file, filename: 'surf_activity.jpg', content_type: 'image/png')
a1.save!

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638314/ski_activity.jpg')
a2 = Activity.create!(name: "Ski")
a2.photo.attach(io: file, filename: 'ski_activity.jpg', content_type: 'image/png')
a2.save!

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638375/vtt_activity.webp')
a3 = Activity.create!(name: "VTT")
a3.photo.attach(io: file, filename: 'vtt_activity.webp', content_type: 'image/png')
a3.save!

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638332/kayak_activity.jpg')
a4 = Activity.create!(name: "Kayak")
a4.photo.attach(io: file, filename: 'kayak_activity.jpg', content_type: 'image/png')
a4.save!

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638358/snowboard_activity.jpg')
a5 = Activity.create!(name: "Snowboard")
a5.photo.attach(io: file, filename: 'snowboard_activity.jpg', content_type: 'image/png')
a5.save!

file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582638342/kite_activity.jpg')
a6 = Activity.create!(name: "Kite-surf")
a6.photo.attach(io: file, filename: 'kite_activity.jpg', content_type: 'image/png')
a6.save!

puts ">>>>>> Done, #{Activity.count} activities created!"
puts "----------"


puts "Create Users"
u1 = User.new(email: "user1@gmail.com", password: 123456, username: "Adrien")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819949/Adrien_gxvz9c.png')
u1.photo.attach(io: file, filename: 'Adrien_gxvz9c.png', content_type: 'image/png')
u1.save

u2 = User.new(email: "user2@gmail.com", password: 123456, username: "Andy")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819971/Andy_mr3kod.png')
u2.photo.attach(io: file, filename: 'Andy_mr3kod.png', content_type: 'image/png')
u2.save

u3 = User.new(email: "user3@gmail.com", password: 123456, username: "Eugène")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819971/Euge%CC%80ne_d4vgpd.png')
u3.photo.attach(io: file, filename: 'Euge%CC%80ne_d4vgpd.png', content_type: 'image/png')
u3.save

u4 = User.new(email: "user4@gmail.com", password: 123456, username: "Joan")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Joan_ar4jw5.png')
u4.photo.attach(io: file, filename: 'Joan_ar4jw5.png', content_type: 'image/png')
u4.save

u5 = User.new(email: "user5@gmail.com", password: 123456, username: "Joe")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Joe_k9wrub.png')
a5.photo.attach(io: file, filename: 'Joe_k9wrub.png', content_type: 'image/png')
u5.save

u6 = User.new(email: "user6@gmail.com", password: 123456, username: "John")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/John_fv9x5r.png')
u6.photo.attach(io: file, filename: 'John_fv9x5r.png', content_type: 'image/png')
u6.save

u7 = User.new(email: "user7@gmail.com", password: 123456, username: "Leo")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Leo_s3uab5.png')
u7.photo.attach(io: file, filename: 'Leo_s3uab5.png', content_type: 'image/png')
u7.save

u8 = User.new(email: "user8@gmail.com", password: 123456, username: "Michel")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Michel_s0sgcg.png')
u8.photo.attach(io: file, filename: 'Michel_s0sgcg.png', content_type: 'image/png')
u8.save

u9 = User.new(email: "user9@gmail.com", password: 123456, username: "Owen")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Owen_j9gxbs.png')
u9.photo.attach(io: file, filename: 'Owen_j9gxbs.png', content_type: 'image/png')
u9.save

u10 = User.new(email: "user10@gmail.com", password: 123456, username: "Jacques")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819972/Jacques_gtessn.png')
u10.photo.attach(io: file, filename: 'Jacques_gtessn.png', content_type: 'image/png')
u10.save

u11 = User.new(email: "user11@gmail.com", password: 123456, username: "Jeremy")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819972/Jeremy_qfv5fe.png')
u11.photo.attach(io: file, filename: 'Jeremy_qfv5fe.png', content_type: 'image/png')
u11.save

u12 = User.new(email: "user12@gmail.com", password: 123456, username: "Kelly")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Kelly_yggnwo.png')
u12.photo.attach(io: file, filename: 'Kelly_yggnwo.png', content_type: 'image/png')
u12.save

u13 = User.new(email: "user13@gmail.com", password: 123456, username: "Koko")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Koko_sdalnk.png')
u13.photo.attach(io: file, filename: 'Koko_sdalnk.png', content_type: 'image/png')
u13.save

u14 = User.new(email: "user14@gmail.com", password: 123456, username: "Seb")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Seb_dzupeu.png')
u14.photo.attach(io: file, filename: 'Seb_dzupeu.png', content_type: 'image/png')
u14.save

u15 = User.new(email: "user15@gmail.com", password: 123456, username: "Yago")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582819985/Yago_d135uf.png')
u15.photo.attach(io: file, filename: 'Yago_d135uf.png', content_type: 'image/png')
u15.save

u16 = User.new(email: "user16@gmail.com", password: 123456, username: "Carissa")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Carissa_xzijt2.png')
u16.photo.attach(io: file, filename: 'Carissa_xzijt2.png', content_type: 'image/png')
u16.save

u17 = User.new(email: "user17@gmail.com", password: 123456, username: "Courtney")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Courtney_a6qgkt.png')
u17.photo.attach(io: file, filename: 'Courtney_a6qgkt.png', content_type: 'image/png')
u17.save

u18 = User.new(email: "user18@gmail.com", password: 123456, username: "Johanne")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Johanne_cxtfvy.png')
u18.photo.attach(io: file, filename: 'Johanne_cxtfvy.png', content_type: 'image/png')
u18.save

u19 = User.new(email: "user19@gmail.com", password: 123456, username: "Justine")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Justine_caqqtz.png')
u19.photo.attach(io: file, filename: 'Justine_caqqtz.png', content_type: 'image/png')
u19.save

u20 = User.new(email: "user20@gmail.com", password: 123456, username: "Keely")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Keely_wu3bfk.png')
u20.photo.attach(io: file, filename: 'Keely_wu3bfk.png', content_type: 'image/png')
u20.save

u21 = User.new(email: "user21@gmail.com", password: 123456, username: "Manuelle")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820019/Manuelle_bzoqqg.png')
u21.photo.attach(io: file, filename: 'Manuelle_bzoqqg.png', content_type: 'image/png')
u21.save

u22 = User.new(email: "user22@gmail.com", password: 123456, username: "Marie")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Marie_su1r1l.png')
u22.photo.attach(io: file, filename: 'Marie_su1r1l.png', content_type: 'image/png')
u22.save

u23 = User.new(email: "user23@gmail.com", password: 123456, username: "Nikki")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Nikki_ubc6gu.png')
u23.photo.attach(io: file, filename: 'v1582820020/Nikki_ubc6gu.png', content_type: 'image/png')
u23.save

u24 = User.new(email: "user24@gmail.com", password: 123456, username: "Pat")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Patricia_exaytc.png')
u24.photo.attach(io: file, filename: 'Patricia_exaytc.png', content_type: 'image/png')
u24.save

u25 = User.new(email: "user25@gmail.com", password: 123456, username: "Sage")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Sage_cmxsqk.png')
u25.photo.attach(io: file, filename: 'Sage_cmxsqk.png', content_type: 'image/png')
u25.save

u26 = User.new(email: "user26@gmail.com", password: 123456, username: "Sally")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Sally_blr7kc.png')
u26.photo.attach(io: file, filename: 'Sally_blr7kc.png', content_type: 'image/png')
u26.save

u27 = User.new(email: "user27@gmail.com", password: 123456, username: "Silvana")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Silvana_g7s5d7.png')
u27.photo.attach(io: file, filename: 'Silvana_g7s5d7.png', content_type: 'image/png')
u27.save

u28 = User.new(email: "user28@gmail.com", password: 123456, username: "Steph")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Stephanie_lrnssg.png')
u28.photo.attach(io: file, filename: 'Stephanie_lrnssg.png', content_type: 'image/png')
u28.save

u29 = User.new(email: "user29@gmail.com", password: 123456, username: "Tati")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Tatiana_gu2tyk.png')
u29.photo.attach(io: file, filename: 'Tatiana_gu2tyk.png', content_type: 'image/png')
u29.save

u30 = User.new(email: "user30@gmail.com", password: 123456, username: "Tyler")
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820020/Tyler_ky7w4g.png')
u30.photo.attach(io: file, filename: 'Tyler_ky7w4g.png', content_type: 'image/png')
u30.save


puts ">>>>>> Done, #{User.count} users created!"
puts "----------"

puts "Create SportSessions"

s1 = SportSession.new(location: "Guethary", start_time: (Date.today - 182), end_time: (Date.today - 182),  capacity: 2, title: "Big Wave Sesh", description: "Alright guys! Who's in for this one?", level: 'expert', open_status: false)
s1.activity = a1
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/surf_guethary_r6ju52.jpg')
s1.photo.attach(io: file, filename: 'surf_guethary_r6ju52.jpg', content_type: 'image/png')

se1a = SessionUser.new(owner: true, status: 'accepted')
se1a.sport_session = s1
se1a.user = u1
se1a.save!

se1b = SessionUser.new(owner: false, status: 'accepted')
se1b.sport_session = s1
se1b.user = u2
se1b.save!

s1.save!
puts "Session1 ok"


s2 = SportSession.new(location: "Cote des basques", start_time: (Date.today - 210), end_time: (Date.today - 210), capacity: 3, title: "Surf women only!!", description: "Conditions are awesome! Let's go!", level: 'intermediate', open_status: false)
s2.activity = a1
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820067/surf_btz_f2rlto.jpg')
s1.photo.attach(io: file, filename: 'surf_btz_f2rlto.jpg', content_type: 'image/png')

se2a = SessionUser.new(owner: true, status: 'accepted')
se2a.sport_session = s2
se2a.user = u16
se2a.save!

se2b = SessionUser.new(owner: false, status: 'accepted')
se2b.sport_session = s2
se2b.user = u17
se2b.save!

se2c = SessionUser.new(owner: false, status: 'accepted')
se2c.sport_session = s2
se2c.user = u18
se2c.save!

s2.save!
puts "Session2 ok"


s3 = SportSession.new(location: "Anglet", start_time: (Date.today + 4), capacity: 4, title: "Perfomance surfing", description: "Who's motivated to hit the road again?", level: 'intermediate')
s3.activity = a1

se3a = SessionUser.new(owner: true, status: 'accepted')
se3a.sport_session = s3
se3a.user = u19
se3a.save!

se3b = SessionUser.new(owner: false, status: 'pending')
se3b.sport_session = s3
se3b.user = u20
se3a.save!

se3c = SessionUser.new(owner: false, status: 'accepted')
se3c.sport_session = s3
se3c.user = u3
se3a.save!

se3c = SessionUser.new(owner: false, status: 'accepted')
se3c.sport_session = s3
se3c.user = u4
se3a.save!

s3.save!

puts "Session3 ok"


s4 = SportSession.new(location: "Cenitz", start_time: (Date.today + 7), capacity: 5, title: "Chill Sessions with friends", description: "Looking for fellow longboarders!", level: 'beginner')
s4.activity = a4

se4a = SessionUser.new(owner: true, status: 'accepted')
se4a.sport_session = s4
se4a.user = u7
se4a.save!

se4b = SessionUser.new(owner: false, status: 'accepted')
se4b.sport_session = s4
se4b.user = u21
se4b.save!

se4c = SessionUser.new(owner: false, status: 'pending')
se4c.sport_session = s4
se4c.user = u22
se4c.save!

se4c = SessionUser.new(owner: false, status: 'pending')
se4c.sport_session = s4
se4c.user = u8
se4c.save!

s4.save!
puts "Session4 ok"


s5 = SportSession.new(location: "capbreton", start_time: (Date.today +3), capacity: 3, title: "Afternoon session", description: "In Les Landes for a few days, hoping to get waves!", level: 'intermediate')
s5.activity = a1

se5a = SessionUser.new(owner: true, status: 'accepted')
se5a.sport_session = s5
se5a.user = u23
se5a.save!

se5b = SessionUser.new(owner: false, status: 'accepted')
se5b.sport_session = s5
se5b.user = u24
se5b.save!

se5c = SessionUser.new(owner: false, status: 'accepted')
se5c.sport_session = s5
se5c.user = u14
se5c.save!

s5.save!
puts "Session5 ok"

s6 = SportSession.new(location: "hossegor", start_time: (Date.today + 10), capacity: 2, title: "First surf at la Nord", description: "Keen to brave the beast?", level: 'expert')
s6.activity = a1

se6a = SessionUser.new(owner: true, status: 'accepted')
se6a.sport_session = s6
se6a.user = u25
se6a.save!

s6.save!
puts "Session6 ok"

s7 = SportSession.new(location: "La Pierre saint martin, 64570", start_time: (Date.today -20), end_time: (Date.today -20), capacity: 2, title: "I'm in love with the coco", description: "Big powder day comin!!!", level: 'expert')
s7.activity = a2
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/ski_powder_ac2unl.jpg')
s7.photo.attach(io: file, filename: 'ski_powder_ac2unl.jpg', content_type: 'image/png')

se7a = SessionUser.new(owner: true, status: 'accepted')
se7a.sport_session = s7
se7a.user = u9
se7a.save!

se7b = SessionUser.new(owner: false, status: 'accepted')
se7b.sport_session = s7
se7b.user = u15
se7b.save!

s7.save!
puts "Session7 ok"


s8 = SportSession.new(location: "La Pierre saint martin, 64570", start_time: (Date.today + 8), capacity: 4, title: "learning ski", description: "Looking for someone to show me the ropes !", level: 'beginner')
s8.activity = a2

se8a = SessionUser.new(owner: true, status: 'accepted')
se8a.sport_session = s8
se8a.user = u30
se8a.save!

se8b = SessionUser.new(owner: false, status: 'accepted')
se8b.sport_session = s8
se8b.user = u29
se8b.save!

s8.save!
puts "Session8 ok"


s9 = SportSession.new(location: "Artouste", start_time: (Date.today + 1), capacity: 3, title: "Freestyle run", description: "Wanna shred ?? join me!!", level: 'expert')
s9.activity = a2

se9a = SessionUser.new(owner: true, status: 'accepted')
se9a.sport_session = s9
se9a.user = u14
se9a.save!

se9b = SessionUser.new(owner: false, status: 'accepted')
se9b.sport_session = s9
se9b.user = u28
se9b.save!

s9.save!
puts "Session9 ok"


s10 = SportSession.new(location: "Bidarray", start_time: (Date.today -180), end_time: (Date.today -180), capacity: 3, title: "Downhill biking", description: "Join me if you enjoy goin fast!", level: 'expert')
s10.activity = a3
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/vtt_women_cloud_kmylbx.jpg')
s10.photo.attach(io: file, filename: 'vtt_women_cloud_kmylbx.jpg', content_type: 'image/png')

se10a = SessionUser.new(owner: true, status: 'accepted')
se10a.sport_session = s10
se10a.user = u1
se10a.save!

se10b = SessionUser.new(owner: false, status: 'accepted')
se10b.sport_session = s10
se10b.user = u2
se10b.save!

se10a = SessionUser.new(owner: false, status: 'accepted')
se10a.sport_session = s10
se10a.user = u15
se10a.save!

s10.save!
puts "Session10 ok"


s11 = SportSession.new(location: "zarautz", start_time: (Date.today -150), end_time: (Date.today -150), capacity: 3, title: "Bike to the coast", description: "Day trip along the sea", level: 'intermediate')
s11.activity = a3
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/vtt_coast_kxwpxx.jpg')
s11.photo.attach(io: file, filename: 'vtt_coast_kxwpxx.jpg', content_type: 'image/png')

se11a = SessionUser.new(owner: true, status: 'accepted')
se11a.sport_session = s11
se11a.user = u16
se11a.save!

se11b = SessionUser.new(owner: false, status: 'accepted')
se11b.sport_session = s11
se11b.user = u17
se11b.save!

se11a = SessionUser.new(owner: false, status: 'accepted')
se11a.sport_session = s11
se11a.user = u13
se11a.save!

se11a = SessionUser.new(owner: false, status: 'accepted')
se11a.sport_session = s11
se11a.user = u12
se11a.save!

s11.save!
puts "Session11 ok"


s12 = SportSession.new(location: "bidart", start_time: (Date.today +10), capacity: 4, title: "Backcountry feel", description: "small tour to discover the surroundings", level: 'beginner')
s12.activity = a3

se12a = SessionUser.new(owner: true, status: 'accepted')
se12a.sport_session = s12
se12a.user = u18
se12a.save!

se12b = SessionUser.new(owner: false, status: 'accepted')
se12b.sport_session = s12
se12b.user = u11
se12b.save!

s12.save!
puts "Session12 ok"


s13 = SportSession.new(location: "gasteiz", start_time: (Date.today +13), capacity: 4, title: "Enduro", description: "Join me to bike up th mountain", level: 'intermediate')
s13.activity = a3

se13a = SessionUser.new(owner: true, status: 'accepted')
se13a.sport_session = s13
se13a.user = u19
se13a.save!

se13b = SessionUser.new(owner: false, status: 'accepted')
se13b.sport_session = s13
se13b.user = u20
se13b.save!

s13.save!
puts "Session13 ok"


s14 = SportSession.new(location: "Ciboure", start_time: (Date.today - 200), end_time: (Date.today - 200),  capacity: 5, title: "Pirogue out to sea", description: "first time on a pirogue, embark on this crazy experience !", level: 'intermediate')
s14.activity = a4
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/kayak_ciboure_ymmbla.jpg')
s14.photo.attach(io: file, filename: 'kayak_ciboure_ymmbla.jpg', content_type: 'image/png')

se14a = SessionUser.new(owner: true, status: 'accepted')
se14a.sport_session = s14
se14a.user = u10
se14a.save!

se14b = SessionUser.new(owner: false, status: 'accepted')
se14b.sport_session = s14
se14b.user = u21
se14b.save!

se14a = SessionUser.new(owner: false, status: 'accepted')
se14a.sport_session = s14
se14a.user = u8
se14a.save!

se14a = SessionUser.new(owner: false, status: 'accepted')
se14a.sport_session = s14
se14a.user = u9
se14a.save!

se14a = SessionUser.new(owner: false, status: 'accepted')
se14a.sport_session = s14
se14a.user = u22
se14a.save!

s14.save!
puts "Session14 ok"


s15 = SportSession.new(location: "Labenne", start_time: (Date.today + 30), capacity: 2, title: "Cruise on the lake", description: "Looking for someone to join me!", level: 'intermediate')
s15.activity = a4

se15a = SessionUser.new(owner: true, status: 'accepted')
se15a.sport_session = s15
se15a.user = u10
se15a.save!


s15.save!
puts "Session15 ok"


s16 = SportSession.new(location: "Oloron-sainte-marie", start_time: (Date.today - 20), end_time: (Date.today - 20), capacity: 4, title: "Backcountry Snowbaord", description: "Snowboarding is mandatory, no skier allowed!", level: 'expert')
s16.activity = a5
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582820064/snow_women_pouhds.jpg')
s16.photo.attach(io: file, filename: 'snow_women_pouhds.jpg', content_type: 'image/png')

se16a = SessionUser.new(owner: true, status: 'accepted')
se16a.sport_session = s16
se16a.user = u23
se16a.save!

se16b = SessionUser.new(owner: false, status: 'accepted')
se16b.sport_session = s16
se16b.user = u24
se16b.save!

se16a = SessionUser.new(owner: false, status: 'accepted')
se16a.sport_session = s16
se16a.user = u25
se16a.save!

se16a = SessionUser.new(owner: false, status: 'accepted')
se16a.sport_session = s16
se16a.user = u11
se16a.save!

s16.save!
puts "Session16 ok"


s17 = SportSession.new(location: "Pau", start_time: (Date.today + 2), capacity: 4, title: "Snowpark session", description: "Working on my double cork", level: 'expert')
s17.activity = a5

se17a = SessionUser.new(owner: true, status: 'accepted')
se17a.sport_session = s17
se17a.user = u3
se17a.save!

se17b = SessionUser.new(owner: false, status: 'accepted')
se17b.sport_session = s17
se17b.user = u4
se17b.save!

s17.save!
puts "Session17 ok"


s18 = SportSession.new(location: "Pic du Midi", start_time: (Date.today + 22), capacity: 2, title: "Kook-friendly", description: "Looking to learn snowboard!", level: 'beginner')
s18.activity = a5

se18a = SessionUser.new(owner: true, status: 'accepted')
se18a.sport_session = s18
se18a.user = u5
se18a.save!

se18b = SessionUser.new(owner: false, status: 'accepted')
se18b.sport_session = s18
se18b.user = u26
se18b.save!

s18.save!
puts "Session18 ok"


s19 = SportSession.new(location: "Hendaye", start_time: (Date.today - 10), end_time: (Date.today - 10),  capacity: 2, title: "kiting to spain", description: "May the wind be with us!!", level: 'intermediate')
s19.activity = a6
file = URI.open('https://res.cloudinary.com/timothee/image/upload/v1582822154/kite_hendaye_cgybt1.png')
s19.photo.attach(io: file, filename: 'kite_hendaye_cgybt1.png', content_type: 'image/png')

se19a = SessionUser.new(owner: true, status: 'accepted')
se19a.sport_session = s19
se19a.user = u6
se19a.save!

se19b = SessionUser.new(owner: false, status: 'accepted')
se19b.sport_session = s19
se19b.user = u27
se19b.save!

s19.save!
puts "Session19 ok"


s20 = SportSession.new(location: "Souston", start_time: (Date.today +17), capacity: 2, title: "freestyle kite", description: "Let's try new tricks", level: 'intermediate')
s20.activity = a6

se20a = SessionUser.new(owner: true, status: 'accepted')
se20a.sport_session = s20
se20a.user = u13
se20a.save!

se20b = SessionUser.new(owner: false, status: 'accepted')
se20b.sport_session = s20
se20b.user = u29
se20b.save!

s20.save!
puts "Session20 ok"

puts ">>>>>> Done, #{SportSession.count} sessions created!"
