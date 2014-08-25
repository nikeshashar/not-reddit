FactoryGirl.define do
  factory :post do
    title 'Fails'
    factory :url_post do
      title 'Url Posting'
      url 'http://google.com'
    end
  end
end