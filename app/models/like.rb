class Like < ApplicationRecord
  validates :name, presence: true
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_likes_counter

  private

  def update_likes_counter
    post.incremant!(:likes_counter)
  end
end
