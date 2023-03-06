require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /users' do
    it 'renders index template with correct placeholder text for users' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here are lists of users')
    end
  end
end
