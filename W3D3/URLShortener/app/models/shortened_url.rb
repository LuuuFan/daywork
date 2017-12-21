require 'securerandom'
# require 'byebug'

class ShortenedUrl < ApplicationRecord
  # self.table_name = "shortened_urls"
  validates :long_url, :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create!(user, long_url)
    ShortenedUrl.new(long_url: long_url, user_id: user.id, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    Visit.all.select { |visit| visit.short_url_id == self.id }.count
  end

  def num_uniques
    Visit.all.select(:user_id).distinct { |v| v.short_url_id == self.id }.count
  end

  def num_recent_uniques
    self.visitors.count
  end

end
