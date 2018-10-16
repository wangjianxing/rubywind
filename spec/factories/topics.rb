FactoryBot.define do
  factory :topic do
    title { Faker::Lorem.word }
    body { Faker::Lorem.word }
    user_id { 33 }
  end
end