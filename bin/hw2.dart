import 'dart:io';

void main() {
  //zadacha 1
  print("enter your age");
  double age = double.parse(stdin.readLineSync()!);
  print("enter your weather");
  double temperature = double.parse(stdin.readLineSync()!);

  if (age >= 20 && age <= 45 && temperature >= -20 && temperature <= 30) {
    print("You can go for a walk.");
  } else if (age <= 20 && temperature >= 0 && temperature <= 28) {
    print("You can go for a walk.");
  } else if (age >= 45 && temperature >= -10 && temperature <= 25) {
    print("You can go for a walk.");
  } else {
    print("Stay home");
  }

  // zadanie 2
  print("enter day of week");
  String day = (stdin.readLineSync())!.toLowerCase();
  print(day);

  switch (day) {
    case "monday":
      print("It's the start of the week!");
    case "tuesday" || "wednesday" || "thursday":
      print("Keep going, almost weekend!");
    case "friday":
      print("Weekend is coming!");
    case "saturday" || "sunday":
      print("Enjoy your weekend!");
    default:
      print("invalid day");
  }

  //zadanie 3
  print("enter password");
  String? password = (stdin.readLineSync()!);
  print(password);

  if (password.length < 6) {
    print("password is too short");
    if (password == "") {
      print("password cannot be empty");
    }
  } else if (password.length >= 6) {
    if (password == "dart123") {
      print("Access granted");
    } else {
      print("Wrong password");
    }
  }
}
