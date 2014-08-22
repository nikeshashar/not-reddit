require 'rails_helper'

describe 'users' do
  let(:user){ create(:user) }

  it 'displays an error when the username is entered incorrectly' do
    visit new_user_registration_path
    fill_in 'Username', with: '@bob@'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end
end