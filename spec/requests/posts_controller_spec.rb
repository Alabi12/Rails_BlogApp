require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /posts' do
    it 'renders index template with correct placeholder text for post' do
      get '/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here are lists of posts')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'renders show template with correct placeholder text' do
      get '/users/id/posts/id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Details of post')
    end
  end
end
