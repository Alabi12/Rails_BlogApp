# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_228_144_251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table_comments
  create_table_likes
  create_table_posts
  create_table_users
end

def create_table_comments
  create_table :comments, force: :cascade do |t|
    t.text :body
    t.bigint :user_id, null: false
    t.bigint :post_id, null: false
    t.timestamps null: false
  end

  add_foreign_key :comments, :users
  add_foreign_key :comments, :posts
  add_index :comments, [:post_id], name: :index_comments_on_post_id
  add_index :comments, [:user_id], name: :index_comments_on_user_id
end

def create_table_likes
  create_table :likes, force: :cascade do |t|
    t.bigint :user_id, null: false
    t.bigint :post_id, null: false
    t.timestamps null: false
  end

  add_foreign_key :likes, :users
  add_foreign_key :likes, :posts
  add_index :likes, [:post_id], name: :index_likes_on_post_id
  add_index :likes, [:user_id], name: :index_likes_on_user_id
end

def create_table_posts
  create_table :posts, force: :cascade do |t|
    t.string :title
    t.text :body
    t.bigint :user_id, null: false
    t.timestamps null: false
  end

  add_foreign_key :posts, :users
  add_index :posts, [:user_id], name: :index_posts_on_user_id
end

def create_table_users
  create_table :users, force: :cascade do |t|
    t.string :name
    t.string :email
    t.string :password_digest
    t.string :photo_link
    t.timestamps null: false
  end

  add_index :users, [:email], unique: true, name: :index_users_on_email
end
