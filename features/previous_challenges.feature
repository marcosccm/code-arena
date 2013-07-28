Feature: Seeing previous challenges
  As a user
  I want to see the previous challenges
  So I can see their solutions

  @javascript
  Scenario: Seeing previous entries
    Given many challenges
    When I go to the home page
    And navigate to previous challenges
    Then I should see all previous challenges
