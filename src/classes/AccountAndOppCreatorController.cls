public with sharing class AccountAndOppCreatorController {

	public Account account {get; set;}
	public Contact contact {get; set;}
	public Opportunity opportunity {get; set;}
	public Account oldAccount {get;set;}
	public Contact oldContact {get; set;}
	public Opportunity oldOpportunity {get; set;}
	public Boolean rendered {get; set;}


	public AccountAndOppCreatorController() {
		blankData();
		rendered = false;
	}

	public void blankData() {
		account = new Account();
		contact = new Contact();
		opportunity = new Opportunity();
		opportunity.StageName = 'Needs Analysis';
		opportunity.CloseDate = Date.today().addDays(30);

	}

	public void reassignData() {
		oldAccount = account;
		oldContact = contact;
		oldOpportunity = opportunity;
	}


	public PageReference createData() {
		System.debug(account);
		System.debug(contact);
		System.debug(opportunity);
		try {

			insert account;
		
			contact.AccountId = account.Id;			

			insert contact;

			opportunity.AccountId = account.Id;

			if(String.isBlank(opportunity.Name)){
				opportunity.Name = account.Name;
			}

			insert opportunity;

			//ApexPages.addMessages(new ApexPages.message(ApexPages.severity.INFO, 'Success!'));
		
		} catch(Exception ex){
			System.debug(ex);
			ApexPages.addMessages(ex);
		}

		rendered = true;
		reassignData();
		blankData();

		return null;

	}

}