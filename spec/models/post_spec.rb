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
end
