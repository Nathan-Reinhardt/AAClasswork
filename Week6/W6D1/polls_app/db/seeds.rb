# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Brandon')
User.create(username: 'Sammy')
User.create(username: 'Kyle')
User.create(username: 'Jeff')
User.create(username: 'Penny')

Poll.create(title: 'BigBully', author_id: 5)
Poll.create(title: 'Fashionista', author_id: 4)
Poll.create(title: 'Hungover', author_id: 3)
Poll.create(title: 'Naughty or Nice', author_id: 2)
Poll.create(title: 'Truth or Dare', author_id: 1)

Question.create(body: 'Do you watch someone get bullied?', poll_id: 1)
Question.create(body: 'What would you do if someone was getting bullied?', poll_id: 1)
Question.create(body: 'Where do you wear a necktie?', poll_id: 2)
Question.create(body: 'Where do shoes go on your body?', poll_id: 2)
Question.create(body: 'Should you drink water?', poll_id: 3)
Question.create(body: 'Should you drink more alcohol?', poll_id: 3)
Question.create(body: 'My mom gets me milk and cookies. Naughty or Nice?', poll_id: 4)
Question.create(body: 'Naughty. This quesiton is naughty', poll_id: 4)
Question.create(body: 'Truth', poll_id: 5)
Question.create(body: 'Dare', poll_id: 5)

#Lots of Answers

AnswerChoice.create(body: '', question_id: 1)
