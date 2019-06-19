FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    price { Faker::Number.decimal(2, 2) }
    description { Faker::Lorem.paragraph_by_chars(256, false) }
    image { File.open('spec/fixtures/1.jpg') }
    date_of_publication { Faker::Date.birthday(10, 20) }
    height { rand(200..300) }
    width { rand(50..200) }
    depth { rand(10..50) }
    # materials
    # author
    category
  end
end
