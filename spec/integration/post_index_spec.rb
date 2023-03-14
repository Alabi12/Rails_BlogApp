require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    subject { User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from mexico.', posts_counter: 0) }

    it 'Display posts view content' do
      post = Post.create(author_id: subject.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                         likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0,
                  likes_counter: 0)
      Comment.create(author_id: subject.id, post_id: post.id, text: 'Test comment')
      visit user_posts_path(subject)

      expect(page).to have_selector('img')
      expect(page).to have_content('Robert')
      expect(page).to have_content('Number of posts')
      expect(page).to have_content('Hello 1')
      expect(page).to have_content('This is my post')
      expect(page).to have_content('Test comment')
      expect(page).to have_content('Comments: 1')
      expect(page).to have_content('Likes: 0')

      click_link('Hello 1')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))
    end
  end
end
