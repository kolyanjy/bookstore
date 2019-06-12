FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  trait :with_facebook do
    provider { 'facebook' }
    uid { '2337086219864242' }
  end

  # factory :facebook_user do
  #   email { 'kolyan654d@gmail.com' }
  #   password { Faker::Internet.password }
  #   first_name { 'Kolyunya' }
  #   last_name { 'Kolesnikov' }
  #   image { 'http://graph.facebook.com/v2.10/2337086219864242/picture' }
  # end
end
