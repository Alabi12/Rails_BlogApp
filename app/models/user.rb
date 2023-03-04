class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.recent_posts(user_id)
    user = User.find(user_id)
    user.posts.order(created_at: :desc).limit(3)
  end

  def update_post_counter
    update(posts_count: posts.count)
  end
end