require_relative 'fake_data_store'
require_relative 'fake_github_auth'
require_relative 'application_runner'
require 'cucumber/rails'

Capybara.default_selector  = :css
Capybara.javascript_driver = :selenium

ActionController::Base.allow_rescue = false
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  @data_store = FakeDataStore.new
  @app        = ApplicationRunner.new
  @auth       = FakeGithubAuth.new
end
