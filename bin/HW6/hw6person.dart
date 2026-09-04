class Person{
  String fullName;
  int age;
  bool isMaried;

  Person(this.fullName, this.age, this.isMaried);

  void introduce(){
    print("Hi! My name is $fullName. I am $age years old. Married: ${isMaried ? 'Yes' : 'No'}.");
  }
}