require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'is valid if username > 4 character and starts with a alphabet character' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is invalid if username is < 4 characters' do
    user = User.create(username: 'bob', email: 'bob@github.com', password: '12345678', password_confirmation: '12345678')
    expect(user).to have(1).error_on(:username)
  end

  it 'is invalid if username starts with a non character value' do
    user = User.create(username: '1bobgithub', email: 'bob@github.com', password: '12345678', password_confirmation: '12345678')
    expect(user).to have(1).error_on(:username)
  end

  it 'is invalid for uniqueness for bobgithub and BobGitHuB' do
    create(:user)
    user = User.create(username: 'BobGitHuB', email: 'bob@github.com', password: '12345678', password_confirmation: '12345678')
    expect(user).to have(1).error_on(:username)
  end
end