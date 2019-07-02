# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'shoulda/matchers'
require 'selenium-webdriver'


Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# require 'capybara/poltergeist'

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|

  Capybara.default_driver = :selenium_chrome

  config.include Devise::Test::ControllerHelpers, type: :controller

  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # Capybara.register_driver :poltergeist_debug do |app|
  #   Capybara::Poltergeist::Driver.new(app, inspector: true)
  # end
  #
  # Capybara.javascript_driver = :poltergeist_debug
end
