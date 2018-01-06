# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :string           not null
#  style      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :band_id, :title, :year, :style, presence: true
  validates :style, inclusion: { in: %w(studio live), message: "Only live or studio can be selected"}

  belongs_to :band

  has_many :tracks



end
