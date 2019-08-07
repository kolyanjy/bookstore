FactoryBot.define do
  factory :payment do
    number { Faker::Number.number(16) }
    name { Faker::FunnyName.two_word_name }
    date { '12/22' }
    cvv { '1235' }
  end
end
