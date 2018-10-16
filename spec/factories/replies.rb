FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.word }
    user_id { 33 }
  end
end