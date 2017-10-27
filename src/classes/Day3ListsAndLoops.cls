// to invoke from dev console: Day3ListsAndLoops.execute();
public with sharing class Day3ListsAndLoops {

	public static void execute() {


		// Create string variable called myName
		String myName = 'Lane';

		// Create new empty list called names
		// THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>();

		// Create new list with default values
		List<String> students = new List<String>{'Student1', 'Student2'};


		// Alternate syntax for creating a new array (list) with 20 empty items
		String[] employees = new String[20];


		names.add('Lane1');
		names.add('Lane2');
		names.add('Lane3');
		names.add('Lane4');

		System.debug('names: ' + names);

		names.remove(3); // remoe item at index 3, which is Lane4

		System.debug('names after last element removed' + names);

		names.remove(names.size() -1);

		System.debug('names after removing names.size()' + names);


		Set<String> uniqueNames = new Set<String>();

		uniqueNames.add('Lane');
		uniqueNames.add('Lane');
		uniqueNames.add('Lane');
		uniqueNames.add('Lane');
		uniqueNames.add('Lane');
		uniqueNames.add('Lane');
		uniqueNames.add('Lane');


		// Store the number of items in our set
		Integer setSize = uniqueNames.size();


		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('setSize: ' + uniqueNames.size());


	}

		public static void executeLoops(){

			// for loop takes three parameters
			// indexVariable
			// condition
			// counterVariable
			for(Integer i = 0; i < 10; i++){
				System.debug('i: ' + i);
			}


			List<String> names = new List<String>();

			names.add('Lane1');
			names.add('Lane2');
			names.add('Lane3');
			names.add('Lane4');

			for(Integer i = 0; i < names.size(); i++){
				System.debug('names: ' + names[i]);
				System.debug('names: ' + names.get(i));

			}

			// Advanced for loop - loop every item in list
			for(String name : names){
				System.debug(name);


			}


		}

		public static void createNewAccount(){

			Account myAccount = new Account();
			myAccount.Name = 'atg';
			myAccount.Type = 'Prospect';
			System.debug('myAccount before insert: ' + myAccount);

			insert myAccount;
		}

		public static void updateExistingAccount(){
		List<Account> queriedAccounts = [Select Id, Name, Type
		FROM Account
		WHERE Name = 'atg'
		LIMIT 1];

		System.debug(queriedAccounts);
		if(queriedAccounts.size() > 0){
			Account myAccount = queriedAccounts[0];
			myAccount.Name = 'CHANGED ACCOUNT NAME';
			update myAccount;
		}
}
		public static void updateAccountTypeOnEveryAccount() {
			// Query all accounts
			List<Account> allAccounts = [Select Id, Type, Name FROM Account];
			// Print out all accounts to console
			System.debug(allAccounts);
			// Loop through accounts
			for(Account everyAccount : allAccounts){
				//Account thisAccount = everyAccount;

			// Update Type to equal "Other"
			everyAccount.Type = 'Other';
		}
			// Update accounts
			update allAccounts;
			// Print out the account to the console
			System.debug('Account that was updated: ' + allAccounts);
	}
}