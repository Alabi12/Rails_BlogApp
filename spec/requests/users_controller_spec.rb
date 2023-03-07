require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'renders index template with correct placeholder text for users' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here are lists of users')
    end
  end

  describe 'GET /users/:id' do
    it 'renders show template with correct placeholder text' do
      get '/users/id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Details of a user')
    end
  end
end
