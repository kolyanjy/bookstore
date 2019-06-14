FactoryBot.define do
  factory :book do
    caption { Faker::Book.title }
    description { Faker::Lorem.paragraph_by_chars(256, false) }
    price { Faker::Number.decimal(2) }
    date_of_publication { Faker::Date.birthday(10, 20) }
    height { rand(20..30) }
    width { rand(5..20) }
    depth { rand(1..5) }
    material { 'paper' }
    category
  end
end
