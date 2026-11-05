import 'package:hw5/database/todo.dart';

enum TodoDetailStatus { initial, loading, success, error }

class TodoDetailState {
  final Todo todo;
  final TodoDetailStatus status;
  final String? errorMessage;

  TodoDetailState({
    required this.todo,
    this.status = TodoDetailStatus.initial,
    this.errorMessage,
  });

  TodoDetailState copyWith({
    Todo? todo, 
    TodoDetailStatus? status,
    String? errorMessage,
  }) {
    return TodoDetailState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

