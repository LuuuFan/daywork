require_relative 'questions_database'
require_relative 'users'
require_relative 'question'


class QuestionFollow
  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, users.fname, users.lname
        FROM question_follows JOIN users on question_follows.user_id = users.id
        WHERE question_follows.question_id = ?
    SQL

    if users.empty?
      nil
    else
      users.map { |user| Users.new(user) }
    end
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.id, questions.title, questions.body, questions.user_id
        FROM question_follows JOIN questions on questions.id = question_follows.question_id
        WHERE question_follows.user_id = ?
    SQL

    if questions.empty?
      nil
    else
      questions.map { |question| Question.new(question) }
    end
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.body
      FROM question_follows JOIN questions ON question_follows.question_id = questions.id GROUP BY question_id ORDER BY count(*) DESC LIMIT ?
    SQL

    if questions.empty?
      nil
    else
      questions
    end

  end
end
