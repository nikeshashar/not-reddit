# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'bobgithub'
    email 'bob@github.com'
    password '12345678'
    password_confirmation '12345678'

    factory :anna do
      username 'anna'
      email 'anna@github.com'
    end

    factory :miahi do
      username 'miahi'
      email 'miahi@github.com'
    end
  end
end
