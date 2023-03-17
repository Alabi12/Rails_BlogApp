class Api::CommentsController < Api::ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create!(params.require(:comment).permit(:text)
     .merge(author_id: params[:user_id], posts_id: @post.id))
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
end
