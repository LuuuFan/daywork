class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true

  has_many :votes, as: :votable

  def vote_count
    self.votes.pluck(:value).reduce(1) do |acc, value|
      acc += value
    end
  end

  has_many :postings

  has_many :subs,
    through: :postings

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

  has_many :comments

  def top_level_comments
    self.comments.where(parent_comment_id: nil).include(:child_comments)
  end

  def comments_by_parent_id
    result = Hash.new {[]}
    comments = self.comments.includes(:author)

    comments.each do |comment|


      result[comment.parent_comment_id] += [comment]

    end
    result
  end
end
