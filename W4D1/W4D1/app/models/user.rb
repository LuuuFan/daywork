# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, presence: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'Artwork'

  has_many :artworks_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'ArtworksShare'

  has_many :shared_artworks,
    through: :artworks_shares,
    source: :artwork

  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Comment'
    
end
