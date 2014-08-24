class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to post_path(@post)
    else
      @comments = Post.find(params[:post_id]).comments
      @comment = Comment.new
      flash[:alert] = "Error: comments cannot be empty!"
      render 'posts/show'
    end
  end
end