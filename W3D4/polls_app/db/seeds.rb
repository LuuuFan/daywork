# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Poll.delete_all
  Question.delete_all
  AnswerChoice.delete_all
  Response.delete_all

  lu = User.create(username: 'luuufan')
  poll = Poll.create(user_id: lu.id, title: 'First Poll')
  question = Question.create(poll_id: poll.id, text: 'This is first text for 1st poll')
  answer_choice_1 = AnswerChoice.create(question_id: question.id, text: 'Option 1')
  answer_choice_2 = AnswerChoice.create(question_id: question.id, text: 'Option 2')
  answer_choice_3 = AnswerChoice.create(question_id: question.id, text: 'Option 3')
  answer_choice_4 = AnswerChoice.create(question_id: question.id, text: 'Option 4')
  res = Response.create(user_id: lu.id, answer_choice_id: answer_choice_4.id)

end
