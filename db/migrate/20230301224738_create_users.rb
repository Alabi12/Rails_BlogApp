class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    table_exists?(:users)
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.string :photo_link
      t.string :posts_counter

      t.timestamps
    end
  end
end
