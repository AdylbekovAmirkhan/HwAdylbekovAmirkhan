void main(){
  // первое задане
  String name = "Ruslanchik";
  int age = 15;
  String city = "Talas";
  String job = "Handyman";
  String hobby = "Chess";

  print("Hello my name is $name and my age is $age,\ni live in $city and i work as $job\nin free time i play $hobby\n");
  // второе

  double salary = 40000;
  double yearIncome = 0;
  double YearIncomeWithBonus = 0;

  yearIncome = salary * 12;
  YearIncomeWithBonus = yearIncome + yearIncome / 10;

  print("My yearly income: $yearIncome\nMy yearly income with 10% bonus: $YearIncomeWithBonus\n");

  // zadanie 3

  String text3Z = " Knowledge is power, but practice makes perfect. ";
  print(text3Z.trim());
  print(text3Z.toUpperCase());
  print(text3Z.replaceAll("power", "experience"));
  print(text3Z.contains("power"));

  // zadanie 4

  int apples = 12;
  int people = 5;

  print("\nEach person gets: ${apples ~/ people}");
  print("Apples left: ${apples % people}\n");

  // zdanie 5

  int currentYear = 2026;
  int myAge = 14;
  print("I was born in ${currentYear - myAge}\n");

  // zadanie 6

  var City6 = "Bichkek";
  final country = "Kyrgyzstan";
  print("City: $City6\nCountry: $country\n final не меняется а то ошибка будет");

  // Вар это обычная переменная с изменяемым значением а Финал с несменяемым


}

