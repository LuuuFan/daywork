require_relative 'questions_database'
require_relative 'question'
require_relative 'users'

class QuestionLike
  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT user_id, users.fname, users.lname
      FROM question_likes
      JOIN users
      ON  users.id = question_likes.user_id
      WHERE question_likes.question_id = ?
    SQL
    if likers.empty?
      'No likers yet'
    else
      likers.map { |liker| Users.new(liker) }
    end
  end
end
