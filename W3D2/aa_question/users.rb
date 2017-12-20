require_relative 'questions_database'
require_relative 'question'
require_relative 'questionfollow'
require_relative 'reply'
require 'byebug'

class Users
  attr_reader :id
  attr_accessor :fname, :lname

  def self.find_by_id(search_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, search_id)
    SELECT * FROM users WHERE id = ?
    SQL
    # debugger
    user.empty? ? 'no such user' : Users.new(user.first)
  end

  def self.find_by_name(first_name, last_name)
    user = QuestionsDatabase.instance.execute(<<-SQL, first_name, last_name)
    SELECT * FROM users WHERE fname = ? AND lname = ?
    SQL
    user.empty? ? 'no such user' : Users.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
end
