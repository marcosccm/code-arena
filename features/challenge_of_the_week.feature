Feature: Challenge of the week
  As a user
  I want to see the challenge of the week
  So I can try to solve it

  @selenium
  Scenario: Current challenge
    Given a current challenge
    When I go to the home page
    Then I should see the challenge

  @selenium
  Scenario: Editing current challenge
    Given a current challenge
    When I go to the home page
    And  I edit the current challenge
    Then I should see the edited challenge
