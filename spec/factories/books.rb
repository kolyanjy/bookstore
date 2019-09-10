FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    price { Faker::Number.positive(from = 1.00, to = 1000.00) }
    description { Faker::Lorem.paragraph_by_chars(256, false) }
    date_of_publication { Faker::Date.birthday(10, 20) }
    height { rand(200..300) }
    width { rand(50..200) }
    depth { rand(10..50) }
    category

    trait :with_image do
      after(:create) do |book|
        create(:book_image, books: [book])
      end
    end

    trait :with_author do
      after(:create) do |book|
        create(:author, books: [book])
      end
    end

    trait :with_material do
      after(:create) do |book|
        create(:material, book: [book])
      end
    end
  end
end
