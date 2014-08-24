class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :value, inclusion: { in: [1, -1] } 
  validates :user_id, uniqueness: {scope: :post_id}
end
