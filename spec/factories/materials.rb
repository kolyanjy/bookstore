FactoryBot.define do
  factory :material do
    sequence(:name) { |n| "material_#{n}" }
  end
end
