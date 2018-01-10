class Comment < ApplicationRecord
  validates :content, presence: true

  has_many :votes, as: :votable

  def vote_count
    self.votes.pluck(:value).reduce(1) do |acc, value|
      acc += value
    end
  end

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

  belongs_to :parent_comment,
    class_name: 'Comment',
    optional: true

  belongs_to :post

  has_many :child_comments,
    foreign_key: :parent_comment_id,
    class_name: 'Comment'


end
