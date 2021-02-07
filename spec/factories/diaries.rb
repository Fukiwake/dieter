FactoryBot.define do
  factory :diary do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    weight { Faker::Number.characters(number: 2) }
  end
end