Feature: User logging
  As a user
  I want to login with my github credentials
  So my I can post challenge solutions

  @selenium
  Scenario: Github Login
    When I log in with my github account
    Then I should see my user details on the page

  @selenium
  Scenario: User logout
    Given I am a logged user
    When I logout of my account
    Then I should not see my user details on the page
