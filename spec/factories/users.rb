FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    api_key { Faker::Internet.uuid }
  end
end
