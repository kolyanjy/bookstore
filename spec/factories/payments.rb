FactoryBot.define do
  factory :payment do
    number { Faker::Number.number(16) }
    name { Faker::FunnyName.two_word_name }
    date { '12/22' }
    cvv { Faker::Number.number(3) }
  end
end
