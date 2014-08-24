class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, length: { minimum: 3 }, format: { with: /\A[A-Za-z]/ }

  def link
    return "/posts/#{id}" if url.nil?
    url
  end
end