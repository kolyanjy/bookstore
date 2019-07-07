FactoryBot.define do
  factory :address do
    association :addressable, factory: :user
    first_name { Faker::FunnyName.two_word_name }
    last_name { Faker::FunnyName.two_word_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    zip { 123 }
    country { Faker::Address.country_code }
    phone { '+380636472129' }
  end
  factory :billing_address, parent: :address, class: 'BillingAddress' do;end
  factory :shipping_address, parent: :address, class: 'ShippingAddress' do;end

end
