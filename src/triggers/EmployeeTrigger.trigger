trigger EmployeeTrigger on Employee__c (before update) {

	if(Trigger.isBefore && Trigger.isBefore){
		LocationManagement.updateStatusDateOnStatusChange(Trigger.new, Trigger.oldMap);
	}

}