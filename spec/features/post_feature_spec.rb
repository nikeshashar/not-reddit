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
      Post.create(title: 'Fails')
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
      fill_in 'Title', with: 'Nandos'
      click_on 'Submit'
      expect(page).not_to have_content 'ActionNotFound'
      expect(page).to have_content 'Nandos'
    end

    it 'will display an error if post form is incorrect' do
      visit new_post_path
      fill_in 'Title', with: ''
      click_on 'Submit'
      expect(page).to have_content 'error'
    end

    context 'can create with optional' do
      it 'text field' do
        visit new_post_path
        fill_in 'Title', with: 'Nandos'
        fill_in 'Text', with: 'This is the greatest place on earth'
        click_on 'Submit'
        expect(page).not_to have_content 'ActionNotFound'
        expect(page).to have_content 'This is the greatest place on earth'
      end

      it 'url link' do
        visit new_post_path
        fill_in 'Title', with: 'Nandos'
        fill_in 'Url', with: 'http://nandos.co.uk'
        click_on 'Submit'
        expect(page).to have_css 'a.post-link'
      end
    end
  end
end