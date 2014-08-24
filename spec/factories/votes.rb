# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    value 1
    factory :down_vote do
      value -1
    end
  end
end
