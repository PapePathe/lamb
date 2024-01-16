Feature: Access galas de lutete
  In order to get info the next galas 
  As a unregistered amateur
  I want to get info

  
  Scenario: list galas de lutte
    Given I have galas named drapeau mansour mbaye, drapeau pape diop organised by xarala événementiel
    And drapeau mansour mbaye has a featured combat yekini contre balla gaye
    When I am on the galas page
    Then I should see "ndefleng - galas de lutte au sénégal"
    Then I should see "drapeau mansour mbaye"
    Then I should see "drapeau pape diop"
    Then I should see "xarala événementiel"
    Then I should see "yekini contre balla gaye"
    When I follow "yekini contre balla gaye"
    Then I should see "drapeau mansour mbaye"  
    Then I should see "yekini"
    Then I should see "balla gaye"
  

