require 'rails_helper'

RSpec.describe PostsHelper, :type => :helper do
  describe '#comments_in_words' do
    it 'returns no comments for 0' do
      expect(comments_in_words(0)).to eq 'no comments'
    end

    it 'returns 1 comment for 1' do
      expect(comments_in_words(1)).to eq '1 comment'
    end

    it 'returns 2 comments for 2' do
      expect(comments_in_words(2)).to eq '2 comments'
    end
  end


end
