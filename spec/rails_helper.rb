# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'

#auth for integration test.
include Warden::Test::Helpers     
Warden.test_mode!

#If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  #use Capybara in test files.
  config.include Capybara::DSL
  #support for javascript when integration test run.
  Capybara.javascript_driver = :webkit
  #use FactoryGirl in test files.
  config.include FactoryGirl::Syntax::Methods

  #use database_cleaner instead auto datas clear, for fix bugs in integration test.
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end
  #include support conig file if you have
  #config.infer_spec_type_from_file_location!
  #config.expect_with(:rspec) { |c| c.syntax = :should }
 
end
