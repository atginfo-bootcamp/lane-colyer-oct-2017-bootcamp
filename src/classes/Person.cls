/**
* Person Class
* A class is made up of the following 3 elements
*
* class level properties
* constructor method
* all other methods
*
*/
public class Person {
	// Static variables are shared across ALL INSTANCES
	private static Boolean isHuman = true;

	// CREATE GETTER AND SETTER MTHODS FOR EACH ONE OF THESE
	private String name;
	private String email;
	private String gender;
	private Double weight;
	private Integer age;
	private final Boolean IS_DEAD;

	public Person(String defaultName) {
		name = defaultName;
		// alternate syntax
		// this.name = defaultName;
		IS_DEAD = false;
	}

	public Person(String defaultName, String defaultEmail) {
		name = defaultName;
		email = defaultEmail;
		IS_DEAD = false;
	}

	public Person(String defaultName, String defaultEmail, Boolean defaultIsDead) {
		name = defaultName;
		email = defaultEmail;
		IS_DEAD = defaultIsDead;
	}


	public void print() {
		System.debug('Person name: ' + name);
		System.debug('Person email: ' + email);
		System.debug('Person gender: ' + gender);
		System.debug('Person weight: ' + weight);
		System.debug('Person age: ' + age);
		//System.debug('Person isDead: ' + isDead);
	}

	/**
	* GETTERS AND SETTERS
	*/

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getEmail(){
		return email;
	}

	public void setEmail(String email){
		this.email = email;
	}

	public Boolean getIsHuman(){
		return isHuman;
	}

	public void setIsHuman(Boolean isHumanVal) {
		isHuman = isHumanVal;
	}

	public String getGender(){
		return gender;
	}

	public void setGender(String gender){
		this.gender = gender;
	}

	public Integer getAge(){
		return age;
	}

	public void setAge(Integer age){
		this.age = age;
	}

	public Double getWeight(){
		return age;
	}

	public void setWeight(Double weight){
		this.weight = weight;
	}
}