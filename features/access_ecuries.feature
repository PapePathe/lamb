Feature: Access ecuries
  In order to access ndefleng ecuries 
  As a unregistered amateur
  I want know all about ecuries 

  
  Scenario: see the list of ecuries
    Given I have ecuries named fass, boul faalé, séreer
    
    When I go to the list of ecuries
    Then I should see "écuries de lutte au sénégal"
    Then I should see "fass"
    And I should see "boul faalé"
    And I should see "séreer"
    
    When I setup & follow "fass" with 10 featured luttteur and 20 not featured lutteurs
    Then I should see "fass"
    Then I should see "featured mbeur 0"
    Then I should see "featured mbeur 9"
    Then I should see "not featured mbeur 0"
    Then I should see "not featured mbeur 19"
    
    
  
  
