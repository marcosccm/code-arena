require 'capybara/dsl'
require 'rspec/matchers'

class Driver
  include Capybara::DSL
end

class ApplicationRunner
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
  end

  def visit_home_page
    @driver.visit('/')
  end

  def shows_challenge(challenge)
    @driver.page.should have_content(challenge)
  end
end
