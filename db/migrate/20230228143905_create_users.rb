class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :Bio
      t.string :post_counter
      t.string :photo_link

      t.timestamps
    end
    add_index :users, unique: true
  end
end
