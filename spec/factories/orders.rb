FactoryBot.define do
  factory :order do
    user

    trait :with_order_item do
      after(:create) do |order|
        category = create(:category, :with_books)
        create(:order_item, book: category.books.first, order: order)
      end
    end

    trait :with_addresses do
      after(:create) do |order|
        order.billing_address = create(:billing_address, addressable: order)
        order.shipping_address = create(:shipping_address, addressable: order)
      end
    end

    trait :with_order_number do
      number { 'R1' }
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

    trait :in_delivery_step do
      status { Order.statuses[:in_delivery] }
    end

    trait :delivered_step do
      status { Order.statuses[:delivered] }
    end

    trait :canceled_step do
      status { Order.statuses[:canceled] }
    end
  end
end
