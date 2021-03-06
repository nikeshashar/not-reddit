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
      user = create(:user)
      create(:post, user: user)
    end

    it 'should display a list of posts' do
      visit posts_path
      expect(page).to have_content 'Fails'
    end
  end
end

describe 'creating new post' do
  context 'as logged out user' do
    it 'should redirect to the sign in page' do
      visit posts_path
      click_on 'New post'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'sign in'
    end
  end

  context 'as a logged in user' do
    before do
      user = create(:user)
      login_as user
    end

    it 'can go to the new posts page' do
      visit posts_path
      click_on 'New post'
      expect(page).not_to have_content 'MissingTemplate'
      expect(page).to have_content 'submit to notreddit'
    end

    it 'can add a new post if all inputs are valid' do
      visit new_post_path
      fill_in 'Title', with: 'Nandos', match: :prefer_exact
      click_on 'Submit', match: :prefer_exact
      expect(page).not_to have_content 'ActionNotFound'
      expect(page).to have_content 'Nandos'
      expect(page).to have_content 'by bobgithub'
    end

    it 'will display an error if post form is incorrect' do
      visit new_post_path
      fill_in 'Title', with: '', match: :prefer_exact
      click_on 'Submit', match: :prefer_exact
      expect(page).to have_content 'error'
    end

    context 'can create with optional' do
      it 'text field' do
        visit new_post_path
        fill_in 'Title', with: 'Nandos', match: :prefer_exact
        fill_in 'Text', with: 'This is the greatest place on earth', match: :prefer_exact
        find('#submit-text').click
        expect(page).not_to have_content 'ActionNotFound'
        expect(page).to have_content 'This is the greatest place on earth'
      end

      it 'url link' do
        visit new_post_path
        fill_in 'Title', with: 'Nandos', match: :prefer_exact
        fill_in 'Url', with: 'http://nandos.co.uk'
        find('#submit-link').click
        expect(page).to have_css 'a.post-link'
        expect(find_link('Nandos')[:href]).to eq 'http://nandos.co.uk'
      end
    end
  end
end