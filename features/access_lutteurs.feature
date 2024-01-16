Feature: Access lutteurs
  In order to access ndefleng lutteurs
  As a unregistered amateur
  I want to see the lutteurs & know about them
  
  
  Scenario: see the list of lutteurs
    Given I have vip lutteurs named yekini, balla gaye, tyson, gris bordeaux
    And I have featured lutteurs named modou lo, eumeu séne 
    When I am on the lutteurs page
    Then I should see "yekini"
    Then I should see "balla gaye"
    Then I should see "modou lo"
    Then I should see "eumeu séne"
    Then I should see "tyson"
    Then I should see "gris bordeaux"
    When I follow "yekini"
    Then I should see "yekini" 
    
  
  

  
