public with sharing class Business {
	
	private static String businessName = 'atg';
	private String locationName;
	private String address;
	private String phoneNumber;
	private List<Employee> employees;



	public Business() {
	// Require all fields are passed in
	// Set all field values - except employees
	this.employees = new List<Employee>();

	}


	public void addEmployee(Employee employee) {
		addEmployee(new List<Employee>{employee});
	}

	public void addEmployee(List<Employee> employees) {
		this.employees.addAll(employees);
	}

	public List<Employee> getEmployees(){

		return this.employees;
	}

	public Employee getEmployeeById(Integer employeeId){
		Employee returnEmployee = null;
		// if employeeId not found, return null
		List<Employee> locationEmployees = getEmployees();
		for(Employee currEmployee : locationEmployees){
			if (currEmployee.EMPLOYEE_ID == employeeId){
				returnEmployee = currEmployee;
			}
		}
		return returnEmployee;
	}

	public void printLocationInfo(){
		System.debug('Business Name' + businessName);
		System.debug('Location: ' + locationName);
		System.debug('Address: ' + address);
		System.debug('Phone Number: ' + phoneNumber);
		System.debug('Employees: ' + employees);
	}

	// work on last, after finishing all other work

	public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId){
		// HINT:use getEmployeeById to get employee on fromLocation
		// remove employee from fromLocation
		// add employee to toLocation
		// need to have a method to remove employee

		// return true if success, false if employee not found
		return false;

	}

	public void removeEmployee(Integer employeeId){

	}

}