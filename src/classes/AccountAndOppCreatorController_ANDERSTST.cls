@isTest
private class AccountAndOppCreatorController_ANDERSTST {

	private static AccountAndOppCreatorController_ANDERS initData(){
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();
		controller.account.Name = 'Test Name';
		controller.account.AccountNumber = 'Test Number';
		controller.account.Description = 'Test Description';
		controller.account.Type = 'Other';

		controller.contact.FirstName = 'Lane';
		controller.contact.LastName = 'Colyer';
		controller.contact.Salutation = 'Test Mr.';

		controller.opportunity.Name = 'Opp Name';
		controller.opportunity.Type = 'New Customer';
		// StageName and CloseDate are set automatically


		return controller;
	}
	

	@isTest static void testControllerInit() {
		// Implement test code
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();


		System.assertNotEquals(null, controller.account);
		System.assertNotEquals(null, controller.contact);
		System.assertNotEquals(null, controller.opportunity);
		System.assertEquals(false, controller.showCreatedDataSection);

		System.assertEquals('Needs Analysis', controller.opportunity.StageName);
		System.assertEquals(Date.today().addDays(30), controller.opportunity.CloseDate);
	}
	
	@isTest static void testAccountNameRequired() {
		
		AccountAndOppCreatorController_ANDERS controller = initData();
		controller.account.Name = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());


	}

	@isTest static void testAccountNumberRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.AccountNumber = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}	
	
	@isTest static void testAccountTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}	

	@isTest static void testContactFirstNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.contact.FirstName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}	

	@isTest static void testContactLastNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.contact.LastName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}

	@isTest static void testOpportunityTypeRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.opportunity.Type = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}

	@isTest static void testOpportunityStageNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.opportunity.StageName = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}	

	@isTest static void testOpportunityCloseDateRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.opportunity.CloseDate = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contacts = [SELECT Id FROM Contact];
		List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
		
		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contacts.size());
		System.assertEquals(0, opportunities.size());
	}

	@isTest static void testSuccessPath() {
		
		// Test that everything was created
		// Test that all values were re-intialized
		// Test that bottom section of UI is shown
		// Test that init values were set

		AccountAndOppCreatorController_ANDERS controller = initData();

		controller.saveData();

		// Test postSaveWork method
		System.assertEquals(1, ApexPages.getMessages().size());

		List<Account> accounts = [SELECT Id, Name FROM Account];
		List<Contact> contacts = [SELECT Id, AccountId, FirstName FROM Contact];
		List<Opportunity> opportunities = [SELECT Id, AccountId, Name FROM Opportunity];
		
		System.assertEquals(1, accounts.size());
		System.assertEquals(1, contacts.size());
		System.assertEquals(1, opportunities.size());

		System.assertEquals(contacts[0].AccountId, accounts[0].Id);
		System.assertEquals(opportunities[0].AccountId, accounts[0].Id);

		// Test that bottom section of UI shows correct data
		System.assertEquals(accounts[0].Name, controller.savedAccount.Name);
		System.assertEquals(contacts[0].FirstName, controller.savedContact.FirstName);
		System.assertEquals(opportunities[0].Name, controller.savedOpportunity.Name);
		
		// Test that bottom section of UI is shown
		System.assertEquals(true, controller.showCreatedDataSection);


		// Test that init values were set

		System.assertEquals('Test Name',controller.account.Name);
		System.assertEquals('Test Number',controller.account.AccountNumber);

		System.assertEquals('Needs Analysis', controller.opportunity.StageName);


	}
	// Continue test required for all required fields

	@isTest static void testOppNameDefaultsToAccountName() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		controller.opportunity.Name = null;
		controller.saveData();
		System.assertEquals(controller.account.Name, controller.opportunity.Name);

	}


	@isTest static void testOppNameRetainsValue() {
		// Test opp name not re written if specified
		
	}


}