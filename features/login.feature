Feature: Login
  In order to login to ndefleng

  Scenario: loggin in ndefleng
  	Given I am a registered user
  	When I go to login page
	And I fill in "email" with "amateur@ndefleng.com"
	And I fill in "password" with "ndefleng"
	And I press "connexion"
	Then I should see "vous etes mantenant connecte"
	Then I should see "amateur@ndefleng.com"
	When I follow "deconnexion"
	Then I should see "vous etes maintenant deconnecte"


  Scenario: try loggin in ndefleng with invalid credentials
  	When I go to login page
	And I fill in "email" with "ndefleng@xarala.sn"
	And I fill in "password" with "ndefleng0000"
	And I press "connexion"
	Then I should see "Email ou mot de passe invalide"
