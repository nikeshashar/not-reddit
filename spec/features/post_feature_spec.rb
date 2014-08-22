require 'rails_helper'

describe 'displaying post feed' do
  context 'no posts' do
    it 'should display a no post message' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'with posts' do
    before do
      create(:post)  
    end

    it 'should display a list of posts' do
      
    end
  end

end