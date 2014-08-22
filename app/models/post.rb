class Post < ActiveRecord::Base
  validates :title, length: { minimum: 3 }, format: { with: /\A[A-Za-z]/ }
end