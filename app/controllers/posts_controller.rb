class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :newest, :top]

  def index
    @posts = Post.all.sort_by(&:hot_points).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text, :url))
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def newest
    @posts = Post.order(created_at: :desc)
  end

  def top
    @posts = Post.all.sort_by(&:score).reverse
  end
end