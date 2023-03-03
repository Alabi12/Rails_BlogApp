class ChangePostsColumnsToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :comments_counter, :integer, default: 0, using: 'comments_counter::integer'
    change_column :posts, :likes_counter, :integer, default: 0, using: 'likes_counter::integer'
  end
end
