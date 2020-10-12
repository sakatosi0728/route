FactoryBot.define do
  factory :room do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user
  end
end
