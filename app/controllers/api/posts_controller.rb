class Api::PostsController < Api::ApplicationController
    def index
      @posts = User.find(params[:user_id])
      render json: @posts
    end
  end