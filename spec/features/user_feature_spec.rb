require 'rails_helper'

describe 'users' do
  let!(:user){ create(:user) }

  it 'displays an error when the username is entered incorrectly' do
    visit new_user_registration_path
    fill_in 'Username', with: '@bob@'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'can login with username' do
    visit new_user_session_path
    fill_in 'Login', with: 'bobgithub'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  context 'deleting posts' do
    before do
      @anna = create(:anna)
      login_as user   
    end

    it 'as the creator has option to delete link' do
      create(:post, user: user)
      visit posts_path 
      expect(page).to have_css '.delete-link', text: 'delete' 
    end
    it 'as the creator can delete link' do
      create(:post, user: user)
      visit posts_path
      find('.delete-link').click
      expect(page).not_to have_content 'Fail'
    end
  end
end