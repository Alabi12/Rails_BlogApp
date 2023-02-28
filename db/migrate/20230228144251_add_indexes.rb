class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    add_index :posts, :user_id
    add_index :comments, :user_id
    add_index :comments, :post_id
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end

