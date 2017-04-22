FactoryGirl.define do
  factory :user do
    email { "user@bloccit.com" }
    password { "password" }
    password_confirmation { "password" }
    username { "BlocHead" }
    confirmed_at { Date.today }
  end
end
