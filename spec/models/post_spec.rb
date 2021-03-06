require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'is valid if title starts with a character and > than 3 characters' do
    post = create(:post)
    expect(post).to be_valid
  end

  it 'is invalid if title is < than 3 characters' do
    post = Post.create(title: 'aa')
    expect(post).to have(1).error_on(:title)
  end

  it 'is invalid if title does not start with an alphabet character' do
    post = Post.create(title: '@abcdef')
    expect(post).to have(1).error_on(:title)
  end

  context '#link' do
    it 'returns the post path if url is blank' do
      post = create(:post)
      expect(post.link).to eq "/posts/#{post.id}"
    end

    it 'returns the url if url is valid' do
      post = create(:post, url: 'http://google.com')
      expect(post.link).to eq "http://google.com"
    end
  end

  context '#score' do
    let(:user) { create(:user) }
    it 'returns 0 if there is no votes for the post' do
      post = create(:post, user: user)
      expect(post.score).to eq 0
    end

    it 'returns 1 if there is 1 up vote for the post' do
      post = create(:post, user: user)
      post.votes.create(value: 1, user: user)
      expect(post.score).to eq 1
    end

    it 'returns -1 if there is 1 down vote for the post' do
      post = create(:post, user: user)
      post.votes.create(value: -1, user: user)
      expect(post.score).to eq -1
    end
  end

  describe '#has_already_voted?' do
    before do
      @bob = create(:user)
      @post = create(:post, user: @bob)  
    end

    it 'returns false if has not voted' do
      expect(@post.has_already_voted?(@bob, -1)).to be false
    end

    it 'returns false if no user' do
      expect(@post.has_already_voted?(nil, -1)).to be false
    end

    it 'returns true if user has voted down' do
      vote = @post.votes.create(value: -1, user: @bob)
      expect(@post.has_already_voted?(@bob, -1)).to be true
    end

    it 'returns false is user has voted the wrong direction' do
      vote = @post.votes.create(value: -1, user: @bob)
      expect(@post.has_already_voted?(@bob, 1)).to be false
    end
  end

  describe '#hot_points' do
    before do
      Timecop.freeze(Date.new(2014,8,20))
      @bob = create(:user)
      @post = create(:post, user: @bob)
    end

    it 'should return 0 if score is 0' do
      expect(@post.hot_points).to eq 0
    end

    it 'should return 6109 if score is 1 and created now' do
      create(:vote, user: @bob, post: @post)
      expect(@post.hot_points).to be_within(10).of(6109.0)
    end

    it 'should return if score is -1 and created now' do
      create(:down_vote, user: @bob, post: @post)
      expect(@post.hot_points).to be_within(10).of(-6110.0)
    end
  end

  describe '#created_by?' do
    before do
      @bob = create(:user)
      @anna = create(:anna)
      @post = create(:post, user: @bob)
    end

    it 'returns false for nil user' do
      expect(@post.created_by?(nil)).to eq false
    end

    it 'returns true if user is the creator of post' do
      expect(@post.created_by?(@bob)).to eq true
    end

    it 'returns false if user is not the creator of post' do
      expect(@post.created_by?(@anna)).to eq false
    end
  end

  describe '#controversy_score' do
    before do
      @bob = create(:user)
      @anna = create(:anna)
      @miahi = create(:miahi)
      @post = create(:post, user: @bob)
    end

    it 'should return 0 if score is 0' do
      expect(@post.controversy_score).to eq 0
    end

    it 'should return 1.73 if 2 up votes and 1 down vote' do
      create(:vote, user: @bob, post: @post)
      create(:vote, user: @anna, post: @post)
      create(:down_vote, user: @miahi, post: @post)
      expect(@post.controversy_score).to be_within(0.01).of(1.73)
    end

    it 'should return 1.73 if 1 up vote and 2 down votes' do
      create(:vote, user: @bob, post: @post)
      create(:down_vote, user: @anna, post: @post)
      create(:down_vote, user: @miahi, post: @post)
      expect(@post.controversy_score).to be_within(0.01).of(1.73)
    end
  end

  describe '#up_votes' do
    before do
      @bob = create(:user)
      @anna = create(:anna)
      @miahi = create(:miahi)
      @post = create(:post, user: @bob)
    end

    it 'returns 0 if there are 0 votes' do
      expect(@post.up_votes).to eq 0
    end

    it 'returns 0 if there is 1 down vote' do
      create(:down_vote, user: @anna, post: @post)
      expect(@post.up_votes).to eq 0
    end

    it 'returns 1 if there is 1 up vote' do
      create(:vote, user: @anna, post: @post)
      expect(@post.up_votes).to eq 1
    end

    it 'returns 2 if there is 2 up votes and 1 down vote' do
      create(:vote, user: @bob, post: @post)
      create(:vote, user: @anna, post: @post)
      create(:down_vote, user: @miahi, post: @post)
      expect(@post.up_votes).to eq 2
    end
  end
end