class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user, optional: true
  belongs_to :goal, optional: true
end
