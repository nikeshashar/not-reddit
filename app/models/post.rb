class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  validates :title, length: { minimum: 3 }, format: { with: /\A[A-Za-z]/ }

  def link
    return "/posts/#{id}" if url.nil?
    url
  end

  def score
    votes.sum(:value)
  end

  def hot_points
    (order + sign * epoch_seconds / 45000).round(7)
  end

  def controversy_score
    return 0 if up_votes <= 0 || down_votes <= 0
    magnitude ** balance
  end

  def has_already_voted? user, value
    return false if user.nil?
    self.votes.any?{|vote| vote.user_id == user.id && vote.value == value}
  end

  def created_by? user
    return false if user.nil?
    user.id == self.user_id
  end

  def up_votes
    self.votes.select{|vote| vote.value == 1 }.count
  end

  private
  def sign_from score
    return 0 if score == 0
    return 1 if score > 0
    -1
  end

  def down_votes
    self.votes.select{|vote| vote.value == -1 }.count
  end

  def magnitude
    up_votes + down_votes
  end

  def balance
    (up_votes > down_votes ) ? down_votes.to_f / up_votes : up_votes.to_f / down_votes
  end

  def order
    Math.log([1, self.score.abs].max,10)
  end

  def sign
    sign_from self.score
  end

  def epoch_seconds
    self.created_at.to_i - 1134028003
  end
end