require 'rails_helper'

describe 'Users' do
  before do
    @bob = create(:user)
    @post = create(:post, user: @bob)
    @comment = create(:comment, user: @bob, post: @post)
  end

  it 'displays the users posts and comments' do
    visit user_path(@bob)
    expect(page).to have_content("bobgithub")
    expect(page).to have_content("Fail")
    expect(page).to have_content("MyText")
  end
end