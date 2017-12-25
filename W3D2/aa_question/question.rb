require_relative 'questions_database'
require_relative 'users'
require_relative 'reply'
require_relative 'questionfollow'
require 'byebug'

class Question
  attr_reader :id
  attr_accessor :title, :body, :user_id

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT * FROM questions WHERE user_id = ?
    SQL
    if questions.empty?
      'no questions yet'
    else
      questions.map { |question| Question.new(question) }
    end
  end

  def self.find_by_id(question_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT * FROM questions WHERE id = ?
    SQL
    if question.empty?
      'no such question'
    else
      Question.new(question[0])
    end
  end

  def initialize(options)
    raise 'user_id cannot be null' if options['user_id'].nil?
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    Users.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
end
