class Cheer < ApplicationRecord
  validates :user, uniqueness: { scope: :goal, message: 'You can only cheer the same goal once'}
  belongs_to :user
  belongs_to :goal


end
