public with sharing class Day5Maps {

	public static void example(String name){

		// For review, this is the syntax of a list
		List<String> namesList = new List<String>();


		namesList.add('Betty');
		namesList.add('John');
		namesList.add('Jack');
		namesList.add('Paul');		

		Boolean foundName = false; // keeps track if name is found

		for(String currentName : namesList){
			if(currentName == name){
				System.debug('Found name in list ' + name);
				foundName = true;
				break; // exits out of for loop
			}
		}

		// if foundName is false
		if (!foundName){
			System.debug('Did not find name in list' + name);
		}



		Map<String, String> namesMap = new Map<String, String>();

			namesMap.put('Betty', 'Betty Boop');
			namesMap.put('John', 'John Boop');
			namesMap.put('Jack', 'Jack Boop');
			namesMap.put('Paul', 'Paul Boop');

			if(namesMap.containsKey(name)){
				System.debug('Found name in map' + name);
			} else {
				System.debug('Name not found in map' + name);

			}
	}

	public static void associateContactsToAccounts(){

		// Alternate syntax
		//Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id,Name FROM Account]);



		List<Account> accountList = [SELECT Id,Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);


		List<Contact> contactList = [
		SELECT Id, FirstName, LastName, Name, AccountId
		FROM Contact
		];

		for(Contact currentContact : contactList){
			if(accountMap.containsKey(currentContact.AccountId)){
				Account currentAccount = accountMap.get(currentContact.AccountId);
				System.debug('Contact: ' + currentContact.Name + ', Account: ' + currentAccount.Name);

		}
		}


	}

}