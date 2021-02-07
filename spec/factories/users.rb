FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    sex { "男性" }
    birthdate { "2021-01-23" }
    height { "180" }
    target_weight { "75" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end