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

  def has_already_voted? user, value
    votes.any?{|vote| vote.user_id == user.id && vote.value == value}
  end
end