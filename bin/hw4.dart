int totalCalls = 0;
void main() {
  greet();
  greet();
  greet();
  introduce("bob", 30);
  introduce("Erkin", 13);
  introduce("Jamal", 17);
  int addNumOutout = addNumbers(15, 17);
  calculateDiscount(price: 100);
  calculateDiscount(price: 100, discount: 12);
  calculateDiscount(price: 122, discount: 13, tax: 20);
  print("Total function calls: $totalCalls");
}

//zadanie 1
void greet() {
  print("Hello! Welcome to Dart programming!");
  totalCalls++;
}

//zadanie 2
void introduce(String name, int age) {
  print("My name is $name and I am $age years old.");
  totalCalls++;
}

//zadanie 3
int addNumbers(int a, int b) {
  int sum = a + b;
  print("sum of $a and $b is $sum");
  totalCalls++;
  return sum;
}

//zadanie 4
double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  double finalPrice = price - (price * discount / 100) + (price * tax / 100);
  totalCalls++;
  print("Final price: $finalPrice");
  return finalPrice;
}
