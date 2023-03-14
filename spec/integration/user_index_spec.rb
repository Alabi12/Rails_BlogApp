require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(name: 'Robert',
                          photo: 'https://www.anisearch.de/images/character/cover/full/0/820.webp', bio: 'Teacher from Mexico.', posts_counter: 0)
      visit users_path
    end

    it 'Display users index content' do
      expect(page).to have_content('Robert')
      expect(page).to have_selector('img')
      expect(page).to have_content('Number of posts')
      click_link('Robert')
      sleep(5)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
