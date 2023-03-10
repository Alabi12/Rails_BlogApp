class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: @user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like saved successfully'

          redirect_to "/users/#{@user.id}/posts/#{@post.id}"
        else
          flash.now[:error] = 'Error: Like could not be saved'
        end
      end
    end
  end
end
