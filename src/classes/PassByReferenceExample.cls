public with sharing class PassByReferenceExample {

	public static void execute() {

		Account myAccount = new Account(Name='Lane and his cool account', Type='Other');
		System.debug('initial value of my account: ' + myAccount);

		modifyAccount(myAccount);
		System.debug('after calling modifyAccount(): ' + myAccount);


		modifyAccountName(myAccount.Name);
		System.debug('after calling modifyAccountName(): ' + myAccount);


	}


	// this method takes an account by reference and modifies properties on it
	// original variable will be modified
	public static void modifyAccount(Account account) {
		
		account.Name = 'THE NAME WAS CHANGED IN modifyAccount()';
		account.Type = 'Prospect';

	}


	// this method takes the account name as a string (Primitive data type) and modifies it
	// this will not modify the original variable
	public static void modifyAccountName(String accountName) {
		accountName = accountName + ' I CHANGED THE NAME AGAIN';

	}

}