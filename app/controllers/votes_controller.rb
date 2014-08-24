class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post.votes.create(value: params[:value], user: current_user)
    render json: { post_score:  @post.score }
  end
end
