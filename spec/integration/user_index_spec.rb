require 'rails_helper'

RSpec.describe 'Users index page', type: :system do
    describe 'confirm the content of the user index page' do
    before :each do
        @user_one = User.create(name: 'bob', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'software developer', posts_counter: 0)
        @user_two = User.create(name: 'alabi', photo: 'https://www.anisearch.de/images/character/cover/full/0/821.webp', bio: 'software engineer', posts_counter: 0)
      end
      it 'should show the right content' do
        visit root_path
        expect(page).to have_content('Here are lists of users')
    end

    it 'profile picture for each user' do
        visit root_path
        expect(page).to have_selector('img')
    end

    it 'number of posts each user written' do
        visit root_path
        expect(page).to have_content('Number of posts')
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
        visit root_path
        click_link 'bob'
        expect(page).to have_content('software developer')
    end
   end
end