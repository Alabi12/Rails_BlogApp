require 'rails_helper'

RSpec.describe 'Posts show view', type: :system do
  let!(:subject) do
    User.create(
      name: 'Robert',
      photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp',
      bio: 'Solider',
      posts_counter: 0
    )
  end
  let!(:post) do
    Post.create(
      author_id: subject.id,
      title: 'Hello 1',
      text: 'This is my post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before do
    Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0, likes_counter: 0)
    Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0, likes_counter: 0)
    Comment.create(author_id: subject.id, post_id: post.id, text: 'Test comment')
  end

  it 'I can see the post\'s title' do
    visit user_posts_path(subject, post)
    expect(page).to have_content(post.title)
  end

  it 'I can see who wrote the post' do
    visit user_posts_path(subject, post)
    expect(page).to have_content(subject.name)
  end

  it 'I can see how many comments it has' do
    visit user_posts_path(subject, post)
    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes it has' do
    visit user_posts_path(subject, post)
    expect(page).to have_content('Likes: 0')
  end

  it 'I can see the post body' do
    visit user_posts_path(subject, post)
    expect(page).to have_content(post.text)
  end

  it 'I can see the username of each commenter' do
    visit user_posts_path(subject, post)
    expect(page).to have_content("#{subject.name}: Test comment")
  end

  it 'I can see the comment each commenter left' do
    visit user_posts_path(subject, post)
    expect(page).to have_content('Test comment')
  end
end
