class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  after_save :update_likes_counter

  private

  def update_likes_counter()
    post = Post.find_by(id: post_id)
    post.likes_counter = Like.where(post_id: post.id).count
    post.save
  end
end
