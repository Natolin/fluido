puts "Destroy all go!"

Subscription.destroy_all
p "#{Subscription.count} should be 0"

Message.destroy_all
p "#{Message.count} should be 0"

Conversation.destroy_all
p "#{Conversation.count} should be 0"

UserInterest.destroy_all
p "#{UserInterest.count} should be 0"

Interest.destroy_all
p "#{Interest.count} should be 0"

Booking.destroy_all
p "#{Booking.count} should be 0"

Lesson.destroy_all
p "#{Lesson.count} should be 0"

Language.destroy_all
p "#{Language.count} should be 0"

User.destroy_all
p "#{User.count} should be 0"

puts "You have just destroyed eveything"
puts "Creating seeds..."



syd = User.create(first_name: "Syd", last_name: "Thomas", username: "MissAmerica", country: "UsaBitch",email: "s@s.com", password: "ssssss", description: 'hello everyboody, im nice and words and stuff nine ten', average_rating: 3.4, photo: "babe.jpeg")
jess = User.create(first_name: "Jesse", last_name: "Davis", username: "MisterMontana", country: "UsaDude",email: "j@j.com", password: "jjjjjj", description: 'hello everyboody, im nice and words and stuff nine ten', average_rating: 5, photo: "gator.jpeg")
pit = User.create(first_name: "Piotr", last_name: "Godzinski", username: "DrunkCaptain", country: "Poland",email: "p@p.com", password: "pppppp", description: 'hello everyboody, im nice and words and stuff nine ten', average_rating: 2.9, photo: "kfc.jpeg")
chris = User.create(first_name: "Chris", last_name: "Philipps", username: "Fluidish", country: "Germany",email: "c@c.com", password: "cccccc", description: 'hello everyboody, im nice and words and stuff nine ten', average_rating: 4.5, photo: "shark.jpeg")
users = User.count
puts "#{users} users created"


spanish = Language.create(name: "Spanish")
english = Language.create(name: "English")
french = Language.create(name: "French")
italian = Language.create(name: "Italian")
german = Language.create(name: "German")
languages = Language.count
puts "#{languages} languages created"



best = Lesson.create(description: "best lesson ever", price: "9", language_id: spanish.id, user_id: syd.id)
worse = Lesson.create(description: "worse lesson ever", price: "4", language_id: english.id, user_id: jess.id)
lessons = Lesson.count
puts "#{lessons} lessons created"

Booking.create(start_date: "2018-02-02 01:00:00 UTC", end_date: "2018-02-02 02:00:00 UTC", user_id: pit.id, lesson_id: best.id )
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-02-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-04-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-06-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-06-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-06-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
Booking.create(start_date: "2018-02-02 01:00:00 UTC", end_date: "2018-02-02 02:00:00 UTC", user_id: pit.id, lesson_id: best.id, rating: 3)
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-02-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id, rating: 5)

bookings = Booking.count
puts "#{bookings} bookings created"



sports = Interest.create(name: "Sports")
food = Interest.create(name: "Food")
travel = Interest.create(name: "Travel/Outdoors")
music = Interest.create(name: "Music")
science = Interest.create(name: "Science/Technology")
literature = Interest.create(name: "Literture")
politics = Interest.create(name: "Politics")
philosophy = Interest.create(name: "Philosophy")
art = Interest.create(name: "Art/Culture")
pets = Interest.create(name: "Pets/Animals")
interests = Interest.count
puts "#{interests} interests created"


UserInterest.create(user_id: syd.id, interest_id: art.id)
UserInterest.create(user_id: syd.id, interest_id: pets.id)
UserInterest.create(user_id: syd.id, interest_id: travel.id)
UserInterest.create(user_id: jess.id, interest_id: philosophy.id)
UserInterest.create(user_id: jess.id, interest_id: music.id)
UserInterest.create(user_id: jess.id, interest_id: food.id)
UserInterest.create(user_id: chris.id, interest_id: pets.id)
UserInterest.create(user_id: chris.id, interest_id: science.id)
UserInterest.create(user_id: chris.id, interest_id: sports.id)
UserInterest.create(user_id: pit.id, interest_id: sports.id)
UserInterest.create(user_id: pit.id, interest_id: music.id)
UserInterest.create(user_id: pit.id, interest_id: literature.id)
user_interests = UserInterest.count
puts "#{user_interests} user_interests created"







# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


