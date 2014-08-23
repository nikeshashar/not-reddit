class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { minimum: 3 }, format: { with: /\A[A-Za-z]/ }
end