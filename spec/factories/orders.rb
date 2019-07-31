FactoryBot.define do
  factory :order do
    user

    trait :with_order_item do
      after(:create) do |order|
        category = create(:category, :with_books)
        create(:order_item, book: category.books.first, order: order)
      end
    end

    trait :address_step do
      status { Order.statuses[:fill_address] }
    end

    trait :delivery_step do
      status { Order.statuses[:fill_delivery] }
    end

    trait :payment_step do
      status { Order.statuses[:fill_payment] }
    end

    trait :confirm_step do
      status { Order.statuses[:fill_confirm] }
    end

    trait :in_progress_step do
      status { Order.statuses[:in_progress] }
    end
  end
end
