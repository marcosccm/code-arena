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

  def visit_previous_challenges
    @driver.click_on "Previous Challenges"
  end

  def shows_success_message(msg)
    expect(@driver.page).to have_content(msg)
  end
end

class ChallengeRunner 
  include RSpec::Matchers

  def initialize
    @driver = Driver.new
    @code_editor = CodeEditor.new(@driver)
  end

  def shows_challenge(*challenges)
    challenges.each do |challenge|
      expect(@driver.page).to have_content challenge.title
      expect(@driver.page).to have_content challenge.content
    end
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
    expect(entries.count).to be > 0
    
    entries.each do |entry|
      @driver.within('#current-entries') do
        expect(@driver.page).to have_content entry[:language]
        expect(@driver.page).to have_content entry[:raw]
        expect(@driver.page).to have_content entry[:author].nickname if entry[:author]
      end
    end
  end

  def submit_challenge_entry(entry)
    @driver.click_on('Add Your Entry!') 
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
      @driver.click_on 'Login'
    end
  end

  def logout
    current_user_section do
      @driver.click_on 'Logout'
    end
  end

  def shows_user_details(user)
    current_user_section do
      expect(@driver.page).to have_content user.nickname
    end
  end

  def do_not_show_user_details(user)
    current_user_section do
      expect(@driver.page).to_not have_content user.nickname
      expect(@driver.page).to have_content 'Login'
    end
  end

  def current_user_section 
    @driver.within('#current-user-info') { yield }
  end
end
