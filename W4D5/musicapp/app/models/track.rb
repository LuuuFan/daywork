# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  ord        :integer          not null
#  title      :string           not null
#  lyrics     :text
#  regular    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :ord, :title, presence: true

  belongs_to :album
  has_many :notes
end
