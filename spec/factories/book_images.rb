FactoryBot.define do
  factory :book_image do
    image { File.open('spec/fixtures/1.jpg') }
  end
end
