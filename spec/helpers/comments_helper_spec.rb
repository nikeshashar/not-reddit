require 'rails_helper'

RSpec.describe CommentsHelper, :type => :helper do

  describe '#comment_delete_link' do
    before do
      @bob = create(:user)
      @post = create(:post, user: @bob)
      @comment = create(:comment, user: @bob, post: @post)
    end
    it 'returns a blank string if user is not owner of comment' do
      expect(comment_delete_link(false, @comment)).to eq ''
    end

    it 'returns a link to delete the comment if it is the owner' do
      expect(comment_delete_link(true, @comment)).to eq(link_to('delete', comment_path(@comment, post_id: @comment.post.id), method: :delete, class: 'delete-comment pull-right'))
    end
  end
end
