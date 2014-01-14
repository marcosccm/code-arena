Feature: Submiting challenge entries
  As a user
  I want to submit a challenge entry
  So others can see my solutions

  @javascript
  Scenario: Seeing current entries
    Given a current challenge
    And many entries for that challenge
    When I go to the home page
    Then I should see the current entries

  @javascript
  Scenario: Posting a challenge entry as a logged user
    Given I am a logged user
    And a current challenge
    When I go to the home page
    And I post a challenge entry
    Then I should see my challenge entry

  @javascript
  Scenario: Posting a challenge entry anonymously
    Given I am not a logged user
    And a current challenge
    When I go to the home page
    And I post a challenge entry
    Then I should see an anonymous challenge entry
