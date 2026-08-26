import 'dart:io';

void main() {
  int warm = 0; // t > 20
  int cool = 0; // 10 <= t <= 20
  int cold = 0; // t < 10

  for (int i = 1; i <= 7; i++) {
    print("Enter temperature for the day:");
    double temp = double.parse(stdin.readLineSync()!);
    if (temp > 20) {
      print("It's warm today!");
      warm = warm + 1;
    } else if (temp >= 10 && temp <= 20) {
      print("It's cool today.");
      cool = cool + 1;
    } else if (temp < 10) {
      print("It's cold today.");
      cold = cold + 1;
    }
  }

  print("Warm days: $warm\nCool days: $cool\nCold days: $cold");
  print("Weekly temperature analysis completed.");
}
