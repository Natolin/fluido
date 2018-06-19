puts "Destroy all go!"

User.destroy_all
p "#{User.count} should be 0"

Language.destroy_all
p "#{Language.count} should be 0"

Lesson.destroy_all
p "#{Lesson.count} should be 0"

Booking.destroy_all
p "#{Booking.count} should be 0"

Interest.destroy_all
p "#{Interest.count} should be 0"

UserInterest.destroy_all
p "#{UserInterest.count} should be 0"

Conversation.destroy_all
p "#{Conversation.count} should be 0"

Message.destroy_all
p "#{Message.count} should be 0"

Subscription.destroy_all
p "#{Subscription.count} should be 0"



puts "You have just destroyed eveything"
puts "Creating seeds..."



syd = User.create(first_name: "Syd", last_name: "Thomas", username: "MissAmerica", country: "UsaBitch",email: "s@s.com", password: "ssssss")
jess = User.create(first_name: "Jesse", last_name: "Davis", username: "MisterMontana", country: "UsaDude",email: "j@j.com", password: "jjjjjj")
pit = User.create(first_name: "Piotr", last_name: "Godzinski", username: "DrunkCaptain", country: "Poland",email: "p@p.com", password: "pppppp")
chris = User.create(first_name: "Chris", last_name: "Philipps", username: "Fluidish", country: "Germany",email: "c@c.com", password: "cccccc")
users = User.count
puts "#{users} users created"


spanish = Language.create(name: "Spanish")
english = Language.create(name: "English")
languages = Language.count
puts "#{languages} languages created"



best = Lesson.create(description: "best lesson ever", price: "9", language_id: spanish.id, user_id: syd.id)
worse = Lesson.create(description: "worse lesson ever", price: "4", language_id: english.id, user_id: jess.id)
lessons = Lesson.count
puts "#{lessons} lessons created"


Booking.create(start_date: "2018-02-02 01:00:00 UTC", end_date: "2018-02-02 02:00:00 UTC", user_id: pit.id, lesson_id: best.id )
Booking.create(start_date: "2018-02-03 01:00:00 UTC", end_date: "2018-02-03 05:30:00 UTC", user_id: chris.id, lesson_id: worse.id)
bookings = Booking.count
puts "#{bookings} bookings created"


sport = Interest.create(name: "sport")
coding = Interest.create(name: "coding")
interests = Interest.count
puts "#{interests} interests created"


UserInterest.create(user_id: syd.id, interest_id: sport.id)
UserInterest.create(user_id: jess.id, interest_id: coding.id)
user_interests = UserInterest.count
puts "#{user_interests} user_interests created"


conv1 = Conversation.create(title: "Spanish lessons")
conv2 = Conversation.create(title: "English lessons")
conversations = Conversation.count
puts "#{conversations} conversations created"


Message.create(content: "Wake up idiot", user_id: pit.id, conversation_id: conv1.id)
Message.create(content: "shut down bastard", user_id: chris.id, conversation_id: conv2.id)
messages = Message.count
puts "#{messages} messages created"


Subscription.create(conversation_id: conv1.id, user_id: syd.id)
Subscription.create(conversation_id: conv2.id, user_id: jess.id)
subscriptions = Subscription.count
puts "#{subscriptions} subscriptions created"




# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


