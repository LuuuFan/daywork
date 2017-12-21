

class Visit < ApplicationRecord
  validates :user_id, :short_url_id, presence: true

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, short_url_id: shortened_url.id)
  end


end
