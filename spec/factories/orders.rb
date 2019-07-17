FactoryBot.define do
  factory :order do
    user

    trait :with_order_item do
      after(:create) do |order|
        create(:category, :with_books)
        create(:order_item, book: Category.first.books.first, order: order)
      end
    end
  end
end
