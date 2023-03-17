class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter
  after_destroy :update_post_counter

  def update_post_counter()
    user = User.find_by(id: author_id)
    user.posts_counter = Post.where(author_id:).count
    user.save
  end

  def recent_comments()
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
