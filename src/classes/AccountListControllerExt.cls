public with sharing class AccountListControllerExt {

	private final Account account;
    public List<Product2> products { get; private set;}

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public AccountListControllerExt(ApexPages.StandardController stdController) {
        this.account = (Account) stdController.getRecord();

        products = [SELECT Id, Name, Family, ProductCode FROM Product2];
    }



}