require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(name: 'Robert', photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from Mexico.',
                          posts_counter: 0)
      #   visit users_path
    end

    it 'can see the username of all other users' do
      visit users_path
      expect(page).to have_content('Robert')
    end

    it 'I can see the profile picture for each user' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'I can see the number of posts each user has written.' do
      visit users_path
      expect(page).to have_content('Number of posts')
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
      visit users_path
      click_link('Robert')
      sleep(5)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
