import '/database/todo.dart';
import 'package:hive/hive.dart';

class AppDatabase {
  final Box box = Hive.box('todoBox');

  AppDatabase() {
    loadTodos();
  }

  List<Todo> _todoList = [];

  void saveTodos() {
    final data = _todoList.map((todo) {
      return {
        "id": todo.id,
        "title": todo.title,
        "isDone": todo.isDone,
        "createdAt": todo.createAt,
        "deadline": todo.deadline,
      };
    }).toList();

    box.put('todos', data);
  }

  void loadTodos() {
    final data = box.get('todos', defaultValue: []);

    _todoList = List<Map>.from(data).map((e) {
      return Todo(
        id: e['id'],
        title: e['title'],
        isDone: e['isDone'],
        createAt: e['createdAt'],
        deadline: e['deadline'],
      );
    }).toList();
  }

  List<Todo> getTodoList() {
    return _todoList;
  }

  void addTodo(Todo todo) {
    _todoList.insert(0, todo);
    saveTodos();
  }

  void updateTodo(int id, String title, String deadline) {
    for (int i = 0; i < _todoList.length; i++) {
      if (_todoList[i].id == id) {
        _todoList[i] = Todo(
          id: _todoList[i].id,
          title: title,
          isDone: _todoList[i].isDone,
          createAt: _todoList[i].createAt,
          deadline: deadline,
        );
        break;
      }
    }
    saveTodos();
  }

  void deleteTodo(int id) {
    _todoList.removeWhere((todo) => todo.id == id);
    saveTodos();
  }
}
