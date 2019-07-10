FactoryBot.define do
  factory :address do
    association :addressable, factory: :user
    first_name { Faker::FunnyName.two_word_name }
    last_name { Faker::FunnyName.two_word_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    zip { '12333' }
    country { Faker::Address.country_code }
    phone { '380631111111' }
  end
  factory :billing_address, parent: :address, class: 'BillingAddress'
  factory :shipping_address, parent: :address, class: 'ShippingAddress'
end
