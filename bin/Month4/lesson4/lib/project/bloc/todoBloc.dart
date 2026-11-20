import 'package:lesson4/project/bloc/todoEvent.dart';
import 'package:lesson4/project/bloc/todoState.dart';
import 'package:lesson4/repository/todoRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();

  TodoBloc() : super(TodoInitialState()) {
    on<GetEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        final list = await _repository.getIt();
        emit(TodoLoadedState(model: list));
      } catch (e) {
        emit(TodoErrorState(errorText: e.toString()));
      }
    });
  }
}

