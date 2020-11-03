FactoryBot.define do
  factory :user do
    account               {"f9g_di3bsf9_7b"}
    name                  {"たろー"}
    prefecture_id         {1}
    profile               {"プロフィールです。"}
    email                 {"taro@test.com"}
    password              {"123abc"}
    password_confirmation {password}
  end
end