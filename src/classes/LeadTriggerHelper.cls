public with sharing class LeadTriggerHelper {
	
	public static void beforeInsert(List<Lead> leadsList) {

		for(Lead currLead : leadsList){
			currLead.Title = 'CEO';
		}
			hotLead(leadsList);

	}


	public static void afterUpdate(List<Lead> leadsList, Map<Id,Lead> oldLeadsMap) {

		// update lead title to lead's ID

		//for(Lead currLead : leadsList){
		//	currLead.Title = currLead.Id;


		//}

		//update leadsList;
	}

	public static void hotLead(List<Lead> leads) {
	/*	New method called hotLead in Lead trigger
Query all Leads with Title from prior class (I used King).
Add 5 more Leads to the list (not through existing King method so that they are not inserted yet)
Make all Leads have a Rating of 'Hot'
Upsert the entire list of leads
**Verify**
Remove 5 additional leads code
Add in check to only update when needed*/

	// Query for existing kings
	List<Lead> kingLeads = [SELECT Title, Rating
	FROM Lead
	WHERE Title = 'King'];

	// Loop 5 times to create 5 new leads, all Colyers fortunately, and made them all Hot Kings
	//for(Integer i = 0; i < 5; i ++){
	//	Lead newLead = new Lead() ;
	//	newLead.LastName = 'Colyer';
	//	newLead.Company = 'ATG';
	//	newLead.Title = 'King';
	//	newLead.Rating = 'Hot';

	//	// added new leads to kingLeads list to keep track of all of our kings
	//	kingLeads.add(newLead);
	//}

	// loop through newly inserted leads checking for kings 
	// because they would not have been returned by the SOQL query
	for(Lead currLead : leads){
		if(currLead.Title == 'King'){
			//kingLeads.add(currLead);
			currLead.Rating = 'Hot';
		}

	}


	// Loop through all kingLeads and change rating to 'Hot'
	for(Lead currLead : kingLeads){
		currlead.Rating	= 'Hot';
	}

	// upsert the kings
	// upsert because some exist in the DB and some don't
	upsert kingLeads;

	}

}