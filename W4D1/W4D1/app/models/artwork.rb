# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'

  has_many :artworks_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'ArtworksShare'

  has_many :shared_viewers,
    through: :artworks_shares,
    source: :viewer
end
