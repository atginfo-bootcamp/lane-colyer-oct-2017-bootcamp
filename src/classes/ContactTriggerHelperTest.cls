@isTest
private class ContactTriggerHelperTest {
	
	private static void stageData(Integer numAccounts, String accountName){

		//Create new accounts based on numAccounts parameter
		//Set up Account fields (i.e. use accountName)
		//Need to insert Accounts to the database 
		// Query our accounts from Database
		//Create contacts for each account
		//Modify fields on Contacts AND relate them to AccountId
		//Insert contacts to the database at once
		List<Account> accounts = new List<Account>();

		for(Integer i = 0; i < numAccounts; i ++){
			Account acct = new Account();
			acct.Name = accountName + ' ' + i;
			accounts.add(acct);
		}

		insert accounts;

		List<Account> queriedAccts = [SELECT Id, Name
									FROM Account
									WHERE Name LIKE :accountName + '%'
									];


		List<Contact> createContacts = new List<Contact>();
		
		
		
		for(Account acct : queriedAccts){
			Integer numberOfContacts = (Integer)(Math.random() * 4);
			for(Integer i =0; i<numberOfContacts; i++){
			Contact currContact = new Contact();
			currContact.LastName = 'Test Boid';
			currContact.AccountId = acct.Id;
			createContacts.add(currContact);

			}
		}

		insert createContacts;
	}


	@isTest static void test_method_one() {
		// Implement test code
		stageData(10, 'Lane');

		List<Account> accountList = [
		SELECT Id, Name, Current_Number_of_Contacts__c,
		(SELECT LastName, AccountId FROM Contacts)
		FROM Account
		];

		System.assertEquals(accountList.size(), 10, 'You did not insert 10 accounts');


	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}