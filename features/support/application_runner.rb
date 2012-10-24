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
    @driver.page.find('input#content')['value'].should == challenge
  end

  def shows_challenge_changed(challenge)
    shows_challenge(challenge)
    @driver.page.should have_content('challenge successfully updated')
  end

  def edit_challenge_content(content)
    @driver.fill_in('content', :with => content)
    @driver.click_on('Edit') 
  end

  def shows_challenge_entries(entries)
    entries.each do |entry|
      @driver.page.should have_content(entry)
    end
  end
end
