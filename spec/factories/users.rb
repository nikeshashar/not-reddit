# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'bob_github'
    email 'bob@github.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
