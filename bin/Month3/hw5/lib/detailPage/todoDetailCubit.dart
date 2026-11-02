import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw5/database/todo.dart';
import 'package:hw5/detailPage/todoDetailState.dart';
import 'package:hw5/main.dart';

class TodoDetailCubit extends Cubit<TodoDetailState> {
  TodoDetailCubit({required Todo todo}) : super(TodoDetailState(todo: todo));

  void updateTodo(String newTitle) {
    if (newTitle.trim().isEmpty) return;
    
    emit(state.copyWith(status: TodoDetailStatus.loading));
    try {
      appRepository.updateTodo(
        state.todo.id,
        newTitle,
        state.todo.deadline,
      );
      emit(state.copyWith(status: TodoDetailStatus.success));
    } catch (_) {
      emit(state.copyWith(status: TodoDetailStatus.error));
    }
  }

  void deleteTodo() {
    emit(state.copyWith(status: TodoDetailStatus.loading));
    try {
      appRepository.deleteTodo(state.todo.id);
      emit(state.copyWith(status: TodoDetailStatus.success));
    } catch (_) {
      emit(state.copyWith(status: TodoDetailStatus.error));
    }
  }
}
