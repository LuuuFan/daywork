require_relative 'questions_database'
require_relative 'users'
require_relative 'question'

class Reply
  def self.find_by_user_id(search_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, search_id)
      SELECT * FROM replies WHERE user_id = ?
    SQL

    if replies.empty?
      'no replies yet'
    else
      replies.map { |reply| Reply.new(reply) }
    end
  end

  def initialize(options)
    raise 'invalid arguments' if options['question_id'].nil? || options['user_id'].nil? || options['body'].nil?
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT * FROM replies WHERE question_id = ?
    SQL

    if replies.empty?
      'no replies yet'
    else
      replies.map { |reply| Reply.new(reply) }
    end
  end

  def author
    Users.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def self.find_by_id(reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
      SELECT * FROM replies WHERE id = ?
    SQL

    if reply.empty?
      'no such reply'
    else
      Reply.new(reply.first)
    end
  end

  def self.find_by_parent_id(reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
      SELECT * FROM replies WHERE parent_id = ?
    SQL

    if reply.empty?
      'no such reply'
    else
      reply.map { |reply| Reply.new(reply) }
    end
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    Reply.find_by_parent_id(@id)
  end
end
