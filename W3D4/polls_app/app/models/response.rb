# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord

  validate :cannot_submit_response_for_same_question_twice, :cannot_response_your_own_poll

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  has_one :question,
    through: :answer_choice,
    source: :question

  # has_one :poll,
  #   through: :question,
  #   source: :poll

  private
  def sibling_responses
    # debugger
    self.question.responses
  end

  def respondent_aready_answered?
    sibling_responses.exists?(user_id: self.respondent.id)
  end

  def cannot_submit_response_for_same_question_twice
    # debugger
    if respondent_aready_answered?
      errors[:base] << 'Cannot submit response for same question twice'
    end
  end

  def is_your_own_poll?
    self.question.poll.user_id == self.user_id
  end

  def cannot_response_your_own_poll
    if is_your_own_poll?
      errors[:base] << 'Cannot response your own poll'
    end
  end

end
