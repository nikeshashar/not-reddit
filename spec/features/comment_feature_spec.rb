require 'rails_helper'

describe 'displaying comments' do
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

describe 'creating comments' do
  before do
    user = create(:user)
    login_as user
    @post = create(:post, user: user)
  end

  context 'as someone logged out' do
    before do
      logout(:user)
    end

    it 'I should not see the submit comments form' do
      visit post_path(@post)
      expect(page).not_to have_css '.new_comment'
    end
  end

  context 'as someone logged in' do
    it 'I can submit a comment' do
      visit post_path(@post)
      fill_in 'Body', with: 'Worst post eva!'
      click_on 'Save'
      expect(page).to have_content 'Worst post eva!'
      expect(page).to have_content '1 comment'
    end

    it 'I cannot submit a blank comment' do
      visit post_path(@post)
      fill_in 'Body', with: ''
      click_on 'Save'
      expect(page).not_to have_content '1 comment'
      expect(page).to have_content 'Error'
    end
  end
end

describe 'deleting comments' do
  before do
    @bob = create(:user)
    login_as @bob
    @post = create(:post, user: @bob)
    @comment = create(:comment, user: @bob, post: @post)
  end

  it 'as the creator has option to delete comment' do
    visit post_path(@post)
    expect(page).to have_css '.delete-comment', text: 'delete' 
  end

  it 'as the creator can delete link' do
    visit post_path(@post)
    find('.delete-comment').click
    expect(page).not_to have_content 'MyText'
  end
end