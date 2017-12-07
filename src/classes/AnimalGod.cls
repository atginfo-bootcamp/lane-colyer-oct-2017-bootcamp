public with sharing class AnimalGod {

	public static void handlesAnimals() {
		Dog myDog = new Dog();
		Fish myFish = new Fish();

		doAnimalStuff(myDog, 'Cheeze-its');
		doAnimalStuff(myFish, 'bubbles');

	}

	public static void doAnimalStuff(Animal animal,String typeOfFood) {
		animal.speak();
		animal.eat(typeOfFood);
	}


}