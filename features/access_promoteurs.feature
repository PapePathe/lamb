Feature: Access promoteurs
  In order to get info about ndefleng promoteurs
  As a unregistered amateur
  I want to  access promoteurs resource

  
  Scenario: get the list on promoteurs
    Given I have promoteurs named gaston nicolai niang
    When I go to the promoteurs page
    Then I should see "gaston"
    Then I should see "nicolai"
    Then I should see "niang"
    When I follow "gaston"
    Then I should see "gaston"
  
  
