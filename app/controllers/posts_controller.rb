class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    if @post.save
      flash[:notice] = 'Post created'
      redirect_to root_path
    else
      render 'new'
    end
  end
end