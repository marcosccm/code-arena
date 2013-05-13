require_relative 'fake_data_store'
require_relative 'fake_github_auth'
require_relative 'application_runner'
require 'capybara/poltergeist'
require 'cucumber/rails'

Capybara.default_selector  = :css
Capybara.javascript_driver = :poltergeist

Capybara.configure do |config|
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end

ActionController::Base.allow_rescue = false
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  @data_store = FakeDataStore.new
  @app        = ApplicationRunner.new
  @auth       = FakeGithubAuth.new
  MongoConnection.drop_all
end

After do
  MongoConnection.drop_all
end
