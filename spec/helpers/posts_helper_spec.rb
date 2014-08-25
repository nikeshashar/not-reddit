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

  describe '#add_voting_colours' do
    it 'adds selected class if user has voted' do
      expect(add_voting_colours(true, 'vote-up')).to eq 'vote-up selected'
    end

    it 'returns original if user has not voted' do
      expect(add_voting_colours(false, 'vote-up')).to eq 'vote-up'
    end
  end

  describe '#add_delete_link' do
    before do
      @bob = create(:user)
      @post = create(:post, user: @bob)
    end

    it 'adds nothing if user is not owner of post' do
      expect(add_delete_link(false, @post)).to eq ''
    end

    it 'adds link if is owner' do
      expect(add_delete_link(true, @post)).to eq(link_to('delete', post_path(@post), method: :delete, class: 'delete-link pull-right'))
    end
  end
end
