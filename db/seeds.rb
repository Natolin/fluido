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



syd = User.create(first_name: "Sydney", last_name: "Thomas", country: "United States",email: "s@s.com", password: "ssssss", description: '', average_rating: 4.2)
jess = User.create(first_name: "Jesse", last_name: "Davis", country: "United States",email: "j@j.com", password: "jjjjjj", description: '', average_rating: 5)
pit = User.create(first_name: "Piotr", last_name: "Godzinski", country: "Poland",email: "p@p.com", password: "pppppp", description: '', average_rating: 2.9)
chris = User.create(first_name: "Chris", last_name: "Philipps", country: "Germany",email: "c@c.com", password: "cccccc", description: '', average_rating: 4.5)
# Extra Users
alexandre = User.create(first_name: "Alexandre", last_name: "Chapuis", country: "France",email: "alexandre@chapuis.com", password: "password", description: '')
emilie = User.create(first_name: "Émilie", last_name: "Hachette", country: "France",email: "emilie@hachette.com", password: "password", description: 'Hi guys, my name is Émilie and I come from Franch. I have been speaking English for many years but I would like to improve. I really look forward to speaking with someone!')
krystian = User.create(first_name: "Krystian", last_name: "Puzio", country: "Polan",email: "krystian@puzio.com", password: "password", description: 'I no speak English much good but I am liking to learn please! Let us talk together!')
leandra = User.create(first_name: "Leandra", last_name: "Moniz", country: "Portugal",email: "leandra@moniz.com", password: "password", description: 'Hi everyone, my name is Leandra and I looove cats. Let\'s talk about cats!!!')
dirk = User.create(first_name: "Dirk", last_name: "Grunwald", country: "Germany",email: "dirk@grunwald.com", password: "password", description: 'Hello, my name is Dirk and I really love Spanish culture. I\'m here on Fluido because right now I am learning to play Flamenco style guitar and I want to learn Spanish also!')
milo = User.create(first_name: "Milo", last_name: "Frasca", country: "Italy",email: "milo@frasa.com", password: "password",  average_rating: 4.2, description: 'Like all Italians, I have strong opinions about food. If you speak English and want to learn Italian, I am your man. I might also be willing to share some secret family recipes...maybe...')
archie = User.create(first_name: "Archie", last_name: "Hamilton", country: "United Kingdom",email: "archie@hamilton.com", password: "password",  average_rating: 3.5, description: 'Fancy a gab in English? Give a call.')
sofia = User.create(first_name: "Sofía", last_name: "Nores", country: "Spain",email: "sofia@nores.com", password: "password",  average_rating: 4, description: 'Quieres hablar en Español! Puedo enseñarte!')
tima = User.create(first_name: "Tima", last_name: "Petrovich", country: "Russia",email: "tima@petrovich.com", password: "password",  average_rating: 2.4, description: '')


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



spanish_lesson = Lesson.create(description: "Los basicos de Español.", price: "10", language_id: spanish.id, user_id: sofia.id)
english_lesson = Lesson.create(description: "Simple conversational American English", price: "5", language_id: english.id, user_id: jess.id)
german_lesson = Lesson.create(description: "Beginning German conversationality", price: "12", language_id: german.id, user_id: chris.id)
italian_lesson = Lesson.create(description: "Imma gonna talka bit abouta da Italian!", price: "13", language_id: italian.id, user_id: milo.id)
french_lesson = Lesson.create(description: "Intermediate French with Alexandre", price: "7", language_id: french.id, user_id: alexandre.id)
polish_lesson = Lesson.create(description: "Join Piotr for a little chat in Polish.", price: "25", language_id: polish.id, user_id: pit.id)
russian_lesson = Lesson.create(description: "I grew up in Siberia. I teach Russian.", price: "45", language_id: russian.id, user_id: tima.id)
portuguese_lesson = Lesson.create(description: "Talk about cats with Leandra", price: "2", language_id: portuguese.id, user_id: leandra.id)

lessons = Lesson.count
puts "#{lessons} lessons created"


Booking.create(start_date: "2018-07-01", start_time: "18:00:00", end_time: "19:00:00" , user_id: dirk.id, lesson_id: spanish_lesson.id)
Booking.create(start_date: "2018-07-02", start_time: "15:00:00", end_time: "16:00:00" , user_id: syd.id, lesson_id: portuguese_lesson.id)
Booking.create(start_date: "2018-07-03", start_time: "17:00:00", end_time: "18:00:00" , user_id: chris.id, lesson_id: polish_lesson.id)
Booking.create(start_date: "2018-07-01", start_time: "16:00:00", end_time: "17:00:00" , user_id: emilie.id, lesson_id: english_lesson.id)
Booking.create(start_date: "2018-07-02", start_time: "15:00:00", end_time: "16:00:00" , user_id: pit.id, lesson_id: russian_lesson.id)
Booking.create(start_date: "2018-07-02", start_time: "16:00:00", end_time: "17:00:00" , user_id: jess.id, lesson_id: german_lesson.id)
Booking.create(start_date: "2018-07-01", start_time: "16:00:00", end_time: "17:00:00" , user_id: syd.id, lesson_id: french_lesson.id)
Booking.create(start_date: "2018-07-02", start_time: "17:00:00", end_time: "18:00:00" , user_id: krystian.id, lesson_id: italian_lesson.id)

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
pets = Interest.create(name: "Animals/Pets")
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
# Fake User interests
UserInterest.create(user_id: alexandre.id, interest_id: literature.id)
UserInterest.create(user_id: alexandre.id, interest_id: politics.id)
UserInterest.create(user_id: alexandre.id, interest_id: pets.id)

UserInterest.create(user_id: emilie.id, interest_id: music.id)
UserInterest.create(user_id: emilie.id, interest_id: travel.id)
UserInterest.create(user_id: emilie.id, interest_id: food.id)

UserInterest.create(user_id: krystian.id, interest_id: sports.id)
UserInterest.create(user_id: krystian.id, interest_id: science.id)
UserInterest.create(user_id: krystian.id, interest_id: food.id)

UserInterest.create(user_id: leandra.id, interest_id: pets.id)
UserInterest.create(user_id: leandra.id, interest_id: literature.id)
UserInterest.create(user_id: leandra.id, interest_id: art.id)

UserInterest.create(user_id: dirk.id, interest_id: art.id)
UserInterest.create(user_id: dirk.id, interest_id: music.id)
UserInterest.create(user_id: dirk.id, interest_id: food.id)

UserInterest.create(user_id: milo.id, interest_id: food.id)
UserInterest.create(user_id: milo.id, interest_id: politics.id)
UserInterest.create(user_id: milo.id, interest_id: philosophy.id)

UserInterest.create(user_id: archie.id, interest_id: sports.id)
UserInterest.create(user_id: archie.id, interest_id: politics.id)
UserInterest.create(user_id: archie.id, interest_id: music.id)

UserInterest.create(user_id: sofia.id, interest_id: travel.id)
UserInterest.create(user_id: sofia.id, interest_id: music.id)
UserInterest.create(user_id: sofia.id, interest_id: pets.id)

UserInterest.create(user_id: tima.id, interest_id: food.id)
UserInterest.create(user_id: tima.id, interest_id: sports.id)
UserInterest.create(user_id: tima.id, interest_id: music.id)

user_interests = UserInterest.count
puts "#{user_interests} user_interests created"







# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


