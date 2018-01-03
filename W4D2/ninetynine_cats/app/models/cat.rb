class Cat < ApplicationRecord
  # COLOR =

  validates :name, :color, :birth_date, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(black white yellow) }
  validates :sex, inclusion: { in: %w(Boy Girl GNC) }

  has_many :cat_rental_requests, dependent: :destroy



end
