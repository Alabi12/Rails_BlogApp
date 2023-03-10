class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  after_save :update_comments_counter

  def update_comments_counter()
    post = Post.find_by(id: post_id)
    post.comments_counter = Comment.where(post_id: post.id).count
    post.save
  end
end
