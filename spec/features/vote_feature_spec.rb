require 'rails_helper'

describe 'voting' do
  before do
    @bob = create(:user)
    @post = create(:post, user: @bob)  
    visit posts_path
  end

  it 'displays the voting count, up and down links next to each post' do
    expect(page).to have_css '.vote-score', text: '0'
    expect(page).to have_css 'a.vote-up'
    expect(page).to have_css 'a.vote-down'
  end

  context 'a post with votes' do
    before do
      login_as @bob
      create(:vote, post: @post, user: @user)
    end

    it 'should display the post score' do
      visit posts_path
      expect(page).to have_css '.vote-score', text: '1'
    end
  end

  context 'as a logged out user' do
    it 'when clicking up vote, should send me to the sign in page', js: true do
      find('a.vote-up').click
      expect(page).to have_content 'Log in'
    end
  end
  context 'as a logged in user' do
    before do
      login_as @bob
    end

    it 'will increase the post score when user up votes it', js: true do
      find('a.vote-up').click
      expect(page).to have_css '.vote-score', text: '1'
    end

    context 'and have already up voted a post' do
      before do
        create(:vote, user: @bob, post: @post)  
      end

      it 'will not change the score if I up vote again', js: true do
        find('a.vote-up').click
        expect(page).to have_css '.vote-score', text: '1'
      end

      it 'will change the score to -1 when I down vote the post', js: true do
        find('a.vote-down').click
        expect(page).to have_css '.vote-score', text: '-1'
      end
      
    end
  end
end