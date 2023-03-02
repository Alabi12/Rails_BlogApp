class AddPostToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post, :string
  end
end
