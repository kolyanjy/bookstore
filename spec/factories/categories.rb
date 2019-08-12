FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category_#{n}" }
  end

  trait :with_books do
    transient do
      amount { 1 }
    end
    after(:create) do |category, evaluator|
      create_list(:book, evaluator.amount, :with_author, category: category)
    end
  end
end
