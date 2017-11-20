@isTest
private class ApexBootcampUnitTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		List<Lead> kings = [SELECT Id, Rating, Title FROM Lead WHERE Title = 'King'];	
	

		System.assert(kings != null);
	
		String idealTitle = 'King';
		for(Lead lead : kings){
		System.assertEquals(Lead.Title, idealTitle, 'It\'s good to be king');

	}


	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}