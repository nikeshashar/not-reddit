require 'rails_helper'

describe 'comments' do
  before do
    user = create(:user)
    login_as user
    @post = create(:post, user: user)
  end

  context 'with no comments' do
    it 'should display no comments on post feed' do
      visit posts_path
      expect(page).to have_css 'a.comment-text' ,text: 'no comments'
    end

    it 'should display no comments on post page' do
      visit posts_path
      find('a.comment-text').click
      expect(current_path).to eq post_path(@post)
      expect(page).to have_content 'No comments yet'
    end
  end
end