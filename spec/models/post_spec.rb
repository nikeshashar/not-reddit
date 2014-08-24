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
end
