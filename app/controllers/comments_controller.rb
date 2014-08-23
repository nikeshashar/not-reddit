class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to post_path(@post)
    else
      render 'posts#new'
    end
  end
end