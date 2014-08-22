require 'rails_helper'

describe 'posts' do
  describe 'no posts' do
    it 'should display a no post message' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
    end
  end

  describe 'creating posts' do
    context 'as a user logged out' do
      
    end
  end
end