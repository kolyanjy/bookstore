FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category_#{n}" }
  end

  trait :with_books do
    after(:create) do |book|
      create_list(:book, 5, :with_author, category: book)
    end
  end

  trait :with_book do
    after(:create) do |book|
      create(:book, :with_author, category: book)
    end
  end
end
