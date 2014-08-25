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

  describe '#created_by?' do
    before do
      @anna = create(:anna)
      @comment = create(:comment, user: user, post: post)
      @second_post = create(:url_post, user: user)
    end

    it 'returns true if user is the owner of the comment of the post' do
      expect(@comment.created_by?(user, post)).to eq true
    end

    it 'returns false if user is nil' do
      expect(@comment.created_by?(nil, post)).to eq false
    end

    it 'returns false if post is nil' do
      expect(@comment.created_by?(user, nil)).to eq false
    end

    it 'returns false if the user is not the owner' do
      expect(@comment.created_by?(@anna, post)).to eq false
    end

    it 'returns false if the post is not matched' do
      expect(@comment.created_by?(user, @second_post)).to eq false
    end
  end
end
