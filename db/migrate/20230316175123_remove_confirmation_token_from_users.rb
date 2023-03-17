class RemoveConfirmationTokenFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :confirmation_token
  end
end
