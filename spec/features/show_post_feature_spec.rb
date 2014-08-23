require 'rails_helper'

describe 'showing post' do
  before do
    user = create(:user)
    login_as user
    @post = create(:post, user: user)
  end

    it 'should display the post' do
      visit post_path(@post)
      expect(page).to have_content('Fail')
      expect(page).to have_content('by bobgithub')
      expect(page).to have_content('no comments')
    end
end