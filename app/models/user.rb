class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts()
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end

  def update_post_counter
    update(posts_count: posts.count)
  end
end
