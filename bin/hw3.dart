void main() {
  // zadanie 1
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      print("Fizz");
    } else if (i % 5 == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }
  // zadanie 2
  double positiveNums = 0;
  double averageNum = 0;
  double sumOfPositiveN = 0;
  List<int> numbers = [3, -2, 0, 7, -5, 10, 1];

  for (int i in numbers) {
    if (i <= 0) {
      print("\nNo positive numbers");
    } else if (i >= 1) {
      positiveNums += 1;
      sumOfPositiveN += i;
      averageNum = sumOfPositiveN / positiveNums;
    }
  }
  print("positive numbers count: $positiveNums");
  print("average of positive numbers: $averageNum\n");

  // zadanie 3

  Map<String, int> fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};

  fruits.forEach((k, v) {
    if (v >= 1) {
      print("Aviable $k ($v pcs)");
    }
  });
}
