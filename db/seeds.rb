require 'factory_bot_rails'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.all.empty?
FactoryBot.create_list(:author, 5)
4.times do
  FactoryBot.create(:category, :with_books)
end
