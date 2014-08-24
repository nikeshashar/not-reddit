require 'rails_helper'

RSpec.describe Vote, :type => :model do
  before do
    @bob = create(:user)
    @post = create(:post, user: @bob)    
  end

  describe 'new up vote' do
    it 'is valid if user has not voted for post before, and value is 1' do
      vote = Vote.create(value: 1, user: @bob, post: @post)
      expect(vote).to be_valid
      expect(vote.value).to eq 1
    end

    it 'is invalid if value is not 1 or -1' do
      vote = Vote.create(value: 2, user: @bob, post: @post)
      expect(vote).to have(1).error_on(:value)
    end

  end

  describe 'new down vote' do
    it 'is valid if user has not voted for post before, and value is -1' do
      vote = Vote.create(value: -1, user: @bob, post: @post)
      expect(vote).to be_valid
      expect(vote.value).to eq -1
    end
  end

end
