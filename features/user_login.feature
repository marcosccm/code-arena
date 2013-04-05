Feature: User logging
  As a user
  I want to login with my github credentials
  So my I can post challenge solutions

  @selenium @wip
  Scenario: Github Login
    When I log in with my github account
    Then I should see my user details on the page
