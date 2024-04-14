import 'dart:io';

// Define an interface
abstract class Loadable {
  void loadFromFile(String filename);
}

// Define a base class
class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('Animal makes a sound');
  }
}

// Define a subclass that inherits from Animal
class Dog extends Animal implements Loadable {
  Dog(String name) : super(name); // Convert 'name' to a super parameter

  @override // Add the '@override' annotation
  void makeSound() {
    print('Dog barks');
  }

  @override // Add the '@override' annotation
  void loadFromFile(String filename) {
    name = File(filename).readAsStringSync().trim();
  }
}

void main() {
  // Demonstrate inheritance and overriding
  Animal dog = Dog('Buddy');
  dog.makeSound(); // Output: Dog barks

  // Demonstrate loading data from a file
  Dog newDog = Dog(''); // Create a new Dog instance
  newDog.loadFromFile('bin/dog_name.txt');
  print('New dog name: ${newDog.name}');
}
