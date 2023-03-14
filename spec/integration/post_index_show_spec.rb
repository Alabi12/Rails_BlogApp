require 'rails_helper'

RSpec.describe 'Posts show view', type: :system do
  describe 'Show page' do
    subject { User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Solider', posts_counter: 0) }

    it 'Display posts view content' do
      post = Post.create(author_id: subject.id, title: 'Hello 1', text: 'This is my post', comments_counter: 0,
                         likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 2', text: 'This is my post 2', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: subject.id, title: 'Hello 3', text: 'This is my post 3', comments_counter: 0,
                  likes_counter: 0)
      comment = Comment.create(author_id: subject.id, post_id: post.id, text: 'Test comment')
      visit user_posts_path(subject, post)

      expect(page).to have_content(post.title)
      expect(page).to have_content(subject.name)
      expect(page).to have_content('Comments: 1')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content(post.text)
      expect(page).to have_content('Robert: Test comment')
      expect(page).to have_content(comment.text)
    end
  end
end
