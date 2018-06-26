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



syd = User.create(first_name: "Syd", last_name: "Thomas", country: "United States",email: "s@s.com", password: "ssssss", description: '', average_rating: 4.2, photo: "babe.jpeg")
jess = User.create(first_name: "Jesse", last_name: "Davis", country: "United States",email: "j@j.com", password: "jjjjjj", description: '', average_rating: 5, photo: "gator.jpeg")
pit = User.create(first_name: "Piotr", last_name: "Godzinski", country: "Poland",email: "p@p.com", password: "pppppp", description: '', average_rating: 2.9, photo: "kfc.jpeg")
chris = User.create(first_name: "Chris", last_name: "Philipps", country: "Germany",email: "c@c.com", password: "cccccc", description: '', average_rating: 4.5, photo: "shark.jpeg")
users = User.count
puts "#{users} users created"


spanish = Language.create(name: "Spanish", flag: "flags/flag_spanish.png" )
english = Language.create(name: "English", flag: "flags/flag_english.png")
french = Language.create(name: "French", flag: "flags/flag_french.png")
italian = Language.create(name: "Italian", flag: "flags/flag_italian.png")
german = Language.create(name: "German", flag: "flags/flag_german.png")
polish = Language.create(name: "Polish", flag: "flags/poland.png")
portuguese = Language.create(name: "Portuguese", flag: "flags/portugese.png")
russian = Language.create(name: "Russian", flag: "flags/russia.png")
languages = Language.count
puts "#{languages} languages created"



spanish_lesson = Lesson.create(description: "Join Sydney for Spanish!", price: "10", language_id: spanish.id, user_id: syd.id)
english_lesson = Lesson.create(description: "Let's talk about 'Merica", price: "4", language_id: english.id, user_id: jess.id)
german_lesson = Lesson.create(description: "Guten Tag!", price: "14", language_id: german.id, user_id: chris.id)
italian_lesson = Lesson.create(description: "Imma gonna talka bit abouta da Italian!", price: "30", language_id: italian.id, user_id: chris.id)
french_lesson = Lesson.create(description: "Je parle juste un petit peu Francais", price: "7", language_id: french.id, user_id: pit.id)
polish_lesson = Lesson.create(description: "I speak Polish. I like teach Polish.", price: "11", language_id: polish.id, user_id: pit.id)
russian_lesson = Lesson.create(description: "Join comrade Sydney", price: "45", language_id: russian.id, user_id: syd.id)
portuguese_lesson = Lesson.create(description: "Let's talk about Rio", price: "2", language_id: portuguese.id, user_id: jess.id)

lessons = Lesson.count
puts "#{lessons} lessons created"

Booking.create(start_date: "2018-02-02", start_time: "12:00:00", end_time: "13:00:00" , user_id: pit.id, lesson_id: spanish_lesson.id )
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: syd.id, lesson_id: portuguese_lesson.id)
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: chris.id, lesson_id: polish_lesson.id)
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: jess.id, lesson_id: german_lesson.id)
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: pit.id, lesson_id: russian_lesson.id)
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: chris.id, lesson_id: french_lesson.id)
Booking.create(start_date: "2018-02-02", start_time: "12:00:00", end_time: "13:00:00" , user_id: jess.id, lesson_id: french_lesson.id, rating: 3)
Booking.create(start_date: "2018-02-03", start_time: "12:00:00", end_time: "13:00:00" , user_id: syd.id, lesson_id: italian_lesson.id, rating: 5)

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


