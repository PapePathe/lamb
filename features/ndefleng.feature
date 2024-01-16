Feature: Ndefleng
  In order to know about senegalese wrestling
  
  Scenario: Get in touch
    Given I am on the ndefleng home page    
    Then I should see "L'actualité de la lutte sénégalaise"
    When I follow "réseau social"
    Then I should see "Ndefleng le 1er réseau social de la lutte au sénégal"
    
    
