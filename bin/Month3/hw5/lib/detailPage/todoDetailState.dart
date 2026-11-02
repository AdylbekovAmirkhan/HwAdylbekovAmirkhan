import 'package:hw5/database/todo.dart';

enum TodoDetailStatus { initial, loading, success, error }

class TodoDetailState {
  final Todo todo;
  final TodoDetailStatus status;

  TodoDetailState({
    required this.todo,
    this.status = TodoDetailStatus.initial,
  });

  TodoDetailState copyWith({Todo? todo, TodoDetailStatus? status}) {
    return TodoDetailState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
    );
  }
}
