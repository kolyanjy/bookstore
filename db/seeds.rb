require 'factory_bot_rails'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.all.empty?

FactoryBot.create_list(:author, 5)
4.times{ FactoryBot.create(:category) }
5.times { BookAuthor.create(author_id: rand(1..5).round(2), book_id: rand(1..15).round(1)) }
