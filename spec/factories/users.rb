FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    after(:create) do |user|
      user.billing_address = create(:billing_address, addressable: user)
      user.shipping_address = create(:shipping_address, addressable: user)
    end
  end

  trait :with_facebook do
    provider { 'facebook' }
    uid { '2337086219864242' }
  end
end
