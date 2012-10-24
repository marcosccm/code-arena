require 'capybara/dsl'
require 'rspec/matchers'
require 'forwardable'

class Driver
  include Capybara::DSL
end

class ApplicationRunner
  include RSpec::Matchers
  extend Forwardable

  def initialize
    @driver = Driver.new
    @challenge_runner = ChallengeRunner.new
    @entry_runner = EntriesRunner.new
  end

  def_delegators :@challenge_runner, :shows_challenge,
                                     :edit_challenge

  def_delegators :@entry_runner, :shows_challenge_entries,
                                 :submit_challenge_entry

  def visit_home_page
    @driver.visit('/')
  end

  def shows_success_message(msg)
    @driver.page.should have_content(msg)
  end
end

class ChallengeRunner 
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
  end

  def shows_challenge(challenge)
    @driver.page.find('input#content')['value'].should == challenge
  end

  def edit_challenge(content)
    @driver.fill_in('content', :with => content)
    @driver.click_on('Edit') 
  end
end

class EntriesRunner
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
  end

  def shows_challenge_entries(entries)
    entries.each do |entry|
      @driver.page.should have_content(entry)
    end
  end

  def submit_challenge_entry(entry)
    @driver.fill_in('entry', :with => entry)
    @driver.click_on('Submit') 
  end
end
