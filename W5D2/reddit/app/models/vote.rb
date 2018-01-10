class Vote < ApplicationRecord
  validates :value, presence: true, inclusion: { in: [1, -1] }
  validates :voter_id, uniqueness: { scope: [:votable_id, :votable_type] }
  belongs_to :votable, polymorphic: true


end
