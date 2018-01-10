class Sub < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :moderator, :title, :description, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: 'User'

  has_many :postings

  has_many :posts,
    through: :postings
end
