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
    @login_runner = LoginRunner.new
  end

  def_delegators :@challenge_runner, :shows_challenge,
                                     :edit_challenge

  def_delegators :@entry_runner, :shows_challenge_entries,
                                 :submit_challenge_entry

  def_delegators  :@login_runner, :login_with_github,
                                  :logout,
                                  :shows_user_details,
                                  :do_not_show_user_details

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
    @code_editor = CodeEditor.new(@driver)
  end

  def shows_challenge(challenge)
    @driver.page.should have_content challenge[:title]
    @driver.page.should have_content challenge[:content]
  end

  def edit_challenge(title, content)
    @driver.click_on('Edit') 
    @driver.fill_in('title', :with => title)
    @code_editor.fill(content)
    @driver.click_on('Save') 
  end
end

class EntriesRunner
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
    @code_editor = CodeEditor.new(@driver)
  end

  def shows_challenge_entries(entries)
    entries.count.should > 0
    
    entries.each do |entry|
      @driver.within('#current-entries') do
        @driver.page.should have_content entry[:description]
        @driver.page.should have_content entry[:language]
        @driver.page.should have_content entry[:raw]
        @driver.page.should have_content entry[:author] if entry[:author]
      end
    end
  end

  def submit_challenge_entry(entry)
    @driver.click_on('Add Your Entry!') 
    @driver.fill_in('description', :with => entry[:description])
    @driver.select(entry[:language], :from => 'language')
    @code_editor.fill(entry[:content])
    @driver.click_on('Submit') 
  end
end

class CodeEditor
  def  initialize(driver)
    @driver = driver
  end

  def fill(content)
    #workaround to edit content without ace editor
    @driver.page.execute_script('jQuery("#content").show();'); 
    @driver.fill_in('content', :with => content)
  end
end

class LoginRunner
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
  end

  def login_with_github
    current_user_section do
      @driver.click_on 'Github!'
    end
  end

  def logout
    current_user_section do
      @driver.click_on 'Sair!'
    end
  end

  def shows_user_details(user)
    current_user_section do
      @driver.page.should have_content user
    end
  end

  def do_not_show_user_details(user)
    current_user_section do
      @driver.page.should_not have_content user
      @driver.page.should have_content 'Github'
    end
  end

  def current_user_section 
    @driver.within('#current-user-info') { yield }
  end

end
