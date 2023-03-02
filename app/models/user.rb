class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def self.recent_posts(user_id)
    user = User.find(user_id)
    user.posts.order(created_at: :desc).limit(3)
  end

  def update_post_counter
    update(posts_count: posts.count)
  end
end
