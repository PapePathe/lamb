Feature: Register amateurs
	In order to allow amateurs to register in ndefleng

	Scenario: Register a new amateur
    	Given I am on the ndefleng home page
    	When I go to devenir membre
    	And I fill in "user[email]" with "xarala@xarala.sn"
    	And I fill in "user[nom_complet]" with "wa xarala"
    	And I fill in "user[password]" with "xarala@xarala.sn"
    	And I fill in "user[password_confirmation]" with "xarala@xarala.sn"
    	And I press "terminer"
    	And I should see "votre compte a ete cree"
