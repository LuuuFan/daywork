# == Schema Information
#
# Table name: artworks_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworksShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'User'

  belongs_to :artwork,
      primary_key: :id,
      foreign_key: :artwork_id,
      class_name: 'Artwork'
end
