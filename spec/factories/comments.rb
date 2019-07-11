FactoryBot.define do
  factory :comment do
    title { Faker::FunnyName.two_word_name }
    description { Faker::Lorem.paragraph }
    mark { 1 }
    verified { 1 }
    user
    book
  end
end
