FactoryBot.define do
  factory :delivery do
    name { Faker::FunnyName.two_word_name }
    min_days { rand(1..3) }
    max_days { rand(1..2) }
    price { Faker::Number.positive.round(2) }
  end
end
