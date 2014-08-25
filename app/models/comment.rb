class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :body, length: { minimum: 1 }

  def created_by?(user, post)
    return false if user.nil? || post.nil?
    (user.id == self.user_id && post.id == self.post_id) ? true : false
  end
end
