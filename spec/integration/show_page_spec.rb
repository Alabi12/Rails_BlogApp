require 'rails_helper'

RSpec.describe 'Users show view', type: :system do
  describe 'Show page' do
    subject { User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from Mexico.', posts_counter: 0) }

    it 'Display users show view content' do
      post = Post.create(author_id: subject.id, title: 'Hello1', text: 'This is my post', comments_counter: 0,
                         likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0,
                  likes_counter: 0)
      visit user_path(subject)

      expect(page).to have_selector('img')
      expect(page).to have_content('Robert')
      expect(page).to have_content('Number of posts')
      expect(page).to have_content('Teacher from Mexico.')
      expect(page).to have_content('See all posts')

      subject.recent_posts.each do |p|
        expect(page).to have_content(p.title)
        expect(page).to have_content(p.text)
      end

      visit user_path(subject)
      click_link('Robert')
      click_link('See all posts')
      sleep(5)
      expect(page).to have_current_path(user_posts_path(subject))

      click_link('Hello1')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))
    end
  end
end
