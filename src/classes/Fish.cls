public with sharing class Fish implements Animal{
	public Fish() {
		
	}

	public void speak() {
		System.debug('The Fish goes HELLO: ');

	}

	public void eat(String typeOfFood){
		System.debug('The Fish likes ' + typeOfFood);

	}

	public void die() {
		System.debug('The fish dies :(');
	}

}