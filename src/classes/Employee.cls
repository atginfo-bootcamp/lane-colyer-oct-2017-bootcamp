// Employee david = new Employee(...);
public with sharing class Employee {
	
	private static Integer nextEmployeeIdNumber = 1;

	public final Integer EMPLOYEE_ID;
	// set these in the constructor
	private String title;
	private String firstName;
	private String lastName;

	private Date hireDate;
	private String status;
	private Datetime statusDate;


	public Employee(String title, String firstName, String lastName) {
		// IMPLEMENT THIS!
		this.hireDate = Date.today();
		this.status = 'Active';
		this.statusDate = Datetime.now();

		this.EMPLOYEE_ID = nextEmployeeIdNumber;
		nextEmployeeIdNumber++;

		this.title = title;
		this.firstName = firstName;
		this.lastName = lastName;
		System.debug('Employee Id: ' + EMPLOYEE_ID);
	}

	public Integer getEmployeeId() {
		return EMPLOYEE_ID;
	}

	public void setStatus(String status){
		if(status == 'Active' || status == 'Terminated' || status == 'Suspended'){
		this.status = status;
		statusDate = Datetime.now();
		} 	else { System.debug('That is not a valid status');
	}
		System.debug(this);
	}

	public String getStatus() {
		return status;
	}

	public Datetime getStatusDate() {
		return statusDate;
	}

	public void printEmployeeInfo(){
		System.debug('EMPLOYEE_ID' + EMPLOYEE_ID);
		System.debug('Title ' + title);
		System.debug('First Name' + firstName);
		System.debug('Last Name' + lastName);
		System.debug('Hire Date' + hireDate);
		System.debug('Status ' + status);
		System.debug('Status Date' + statusDate);
	}

	public void setTitle (String toTitle) {
		this.title = toTitle;
		System.debug(this);
	}

	public void changeLastName (String toLastName) {
		this.lastName = toLastName;
		System.debug(this);
	}
}