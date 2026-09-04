import 'hw6person.dart';
import 'hw6esubjects.dart';

class Student extends Person{
  Map<Subjects, double> marks;
  Student(super.fullName, super.age, super.isMaried, this.marks);

  void showMarks(){
    for (var entry in marks.entries){
      print("${entry.key} : ${entry.value}");
    }
  }

  double calculateAverage(){
     double sum = 0;
     for (var entry in marks.values){
        sum += entry;
     }
     double average = sum / marks.values.length;
     return average;

  }
}