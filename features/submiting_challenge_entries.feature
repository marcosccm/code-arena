Feature: Submiting challenge entries
  As a user
  I want to submit a challenge entry
  So others can see my solutions

  Scenario: Seeing current entries
    Given a current challenge
    And many entries for that challenge
    When I go to the home page
    Then I should see the current entries
