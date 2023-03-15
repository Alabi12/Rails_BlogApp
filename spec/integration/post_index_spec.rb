require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  before(:each) do
    @user = User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from mexico.',
                        posts_counter: 0)
    @post_one = Post.create(author_id: @user.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0, likes_counter: 0)
    @post_two = Post.create(author_id: @user.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0, likes_counter: 0)
    @post_three = Post.create(author_id: @user.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0, likes_counter: 0)
    Comment.create(author_id: @user.id, post_id: @post_one.id, text: 'Test comment')
  end

  it "I can see the user's profile picture" do
    visit user_posts_path(@user)
    expect(page).to have_selector('img')
  end

  it "I can see the user's username" do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'I can see the number of posts the user has written' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.posts_counter)
  end

  it "I can see a post's title" do
    visit user_posts_path(@user)
    expect(page).to have_content(@post_one.title)
  end

  it "I can see some of the post's body" do
    visit user_posts_path(@user)
    expect(page).to have_content(@post_one.text[0..100])
  end

  it 'I can see how many comments a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content('Test comment')
  end

  it 'I can see how many likes a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content('Likes: 0')
  end

  it "When I click on a post, it redirects me to that post's show page" do
    visit user_posts_path(@user)
    click_link('Hello 1')
    sleep(5)
    expect(page).to have_current_path(user_post_path(@user, @post_one))
  end
end
