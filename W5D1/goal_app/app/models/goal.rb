class Goal < ApplicationRecord
  validates :title, :details, :private, :completed, presence: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :cheers
end
