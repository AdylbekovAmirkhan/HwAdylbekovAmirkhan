import 'hw6esubjects.dart';
import 'hw6person.dart';
import 'hw6student.dart';

void main(){
  Person ktoto = Person("Khan", 20, true);
  ktoto.introduce();
  Student ktoto2 = Student("js", 38, false, 
  {
    Subjects.english: 50,
    Subjects.chemistry:22,
    Subjects.math: 12,
    Subjects.physics: 83,
  } );
  ktoto2.showMarks();
  print(ktoto2.calculateAverage());
  
}