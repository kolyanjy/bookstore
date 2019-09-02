source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# form helpers
gem 'simple_form'
gem 'client_side_validations' # rubocop:disable Bundler/OrderedGems
gem 'client_side_validations-simple_form'
gem 'country_select'

# authentication
gem 'devise'
gem 'omniauth-facebook'

# interactors
gem 'interactor'

# decorators
gem 'draper'

# states
gem 'aasm'

# html css
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'haml'
gem 'sass-rails', '~> 5.0'

# for images
gem 'carrierwave'
gem 'mini_magick'

# pagination
gem 'pagy'

# DB
gem 'pg'

# admin-panel
gem 'activeadmin'

# system gems
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sendgrid-ruby'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.9'
  gem 'pry-byebug'
  gem 'rails_best_practices'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'awesome_rails_console', '~> 0.4.0'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'rack_session_access'
  gem 'rails-controller-testing'
  gem 'rspec', '~> 3.8'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
