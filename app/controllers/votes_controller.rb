class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    Vote.where(user_id: current_user.id, post_id: @post.id).first_or_initialize.update_attributes(value: params[:value])
    render json: { post_score:  @post.score }
  end
end
