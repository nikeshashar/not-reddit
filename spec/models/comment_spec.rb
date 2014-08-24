require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  it 'is valid if it has a user and post and body is greater than 1 character' do
    comment = Comment.create(user_id: user.id, post_id: post.id, body: 'this sucks')
    expect(comment).to be_valid
  end

  it 'is invalid if body is < 1 character' do
    comment = Comment.create(user_id: user.id, post_id: post.id, body: '')
    expect(comment).to have(1).error_on(:body)
  end
end
