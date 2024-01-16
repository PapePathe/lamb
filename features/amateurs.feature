Feature: Amateurs
  In order to let amateurs get connected

  Scenario: View the social network homepage as a guest
    Given I have amateurs doudou diagne diecko, max mbergane
    Given I am on the amateurs page
    When I follow "doudou diagne diecko"
    Then I should see "doudou diagne diecko"
