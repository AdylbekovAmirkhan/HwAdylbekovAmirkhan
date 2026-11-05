import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw5/database/todo.dart';
import 'package:hw5/detailPage/todoDetailState.dart';
import 'package:hw5/main.dart';
import 'package:hw5/detailPage/todoExceptions.dart';

class TodoDetailCubit extends Cubit<TodoDetailState> {
  TodoDetailCubit({required Todo todo}) : super(TodoDetailState(todo: todo));

  void updateTodo(String newTitle) {
    final trimmedTitle = newTitle.trim();

    try {
      if (trimmedTitle.isEmpty) {
        throw EmptyTitleException();
      }
      if (trimmedTitle.length < 4) {
        throw ShortTitleException();
      }

      emit(state.copyWith(status: TodoDetailStatus.loading));
      
      appRepository.updateTodo(
        state.todo.id,
        trimmedTitle,
        state.todo.deadline,
      );
      
      emit(state.copyWith(status: TodoDetailStatus.success));
    } on EmptyTitleException catch (e) {
      emit(state.copyWith(status: TodoDetailStatus.error, errorMessage: e.message));
    } on ShortTitleException catch (e) {
      emit(state.copyWith(status: TodoDetailStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(status: TodoDetailStatus.error, errorMessage: 'Произошла непредвиденная ошибка'));
    }
  }

  void deleteTodo() {
    emit(state.copyWith(status: TodoDetailStatus.loading));
    try {
      appRepository.deleteTodo(state.todo.id);
      emit(state.copyWith(status: TodoDetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoDetailStatus.error, errorMessage: 'Не удалось удалить задачу'));
    }
  }
}