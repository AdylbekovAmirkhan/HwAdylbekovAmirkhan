import 'package:flutter_bloc/flutter_bloc.dart';
import '/database/app_database.dart';
import '/database/todo.dart';
import '/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  AppDatabase _appDatabase = AppDatabase();
  List<Todo> todoList = [];
  
  HomeCubit():super (HomeState(todoList: [], status: .isLoading));

  void getTodoList() {
    todoList = _appDatabase.getTodoList();

    if(todoList.isEmpty) {
      emit(state.copyWith(todoList: [], status: .empty));
    } else {
      emit(state.copyWith(todoList: todoList, status: .success));
    }
  }
}