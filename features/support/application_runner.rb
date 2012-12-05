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
    @driver.page.should have_content challenge[:title]
    @driver.page.should have_content challenge[:content]
  end

  def edit_challenge(title, content)
    @driver.click_on('Edit') 
    @driver.fill_in('title',   :with => title)
    @driver.fill_in('content', :with => content)
    @driver.click_on('Save') 
  end
end

class EntriesRunner
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
  end

  def shows_challenge_entries(entries)
    entries.count.should > 0
    entries.each do |entry|
      @driver.page.should have_content(entry[:title])
    end
  end

  def submit_challenge_entry(entry)
    @driver.click_on('Add Your Entry!') 
    @driver.fill_in('title', :with => entry)
    @driver.click_on('Submit') 
  end
end
