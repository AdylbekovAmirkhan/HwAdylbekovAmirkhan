import 'package:hw2/database/todo.dart';

class AppDatabase {
  List<Todo> _todoList = [
    Todo(id: 1, title: "Купить телефон", isDone: false, createAt: "31.08.2026", deadline: "01.10.2026"),
    Todo(id: 2, title: "Посмотреть фильм Дюна", isDone: false, createAt: "16.10.2026", deadline: "18.10.2026"),
    Todo(id: 3, title: "Записаться в зал", isDone: true, createAt: "25.05.2026", deadline: "01.06.2026"),
    Todo(id: 4, title: "еще задачка", isDone: false, createAt: "12.05.2026", deadline: "01.09.2027")
    ];

    List<Todo> getTodoList() {
      return _todoList;
    }
}