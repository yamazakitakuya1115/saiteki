FactoryBot.define do
  factory :user do

    after(:build) do |picture|
      picture.image.attach(io: File.open('images/test_image.jpg'), filename: 'test_image.jpg')
    end

    account               {"f9g_di3bsf9_7b"}
    name                  {"たろー"}
    prefecture_id         {1}
    email                 {"taro@test.com"}
    password              {"123abc"}
    password_confirmation {password}
  end
end