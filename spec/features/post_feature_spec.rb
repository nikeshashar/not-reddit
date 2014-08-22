require 'rails_helper'

describe 'displaying post feed' do
  context 'no posts' do
    it 'should display a no post message' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
    end
  end

end