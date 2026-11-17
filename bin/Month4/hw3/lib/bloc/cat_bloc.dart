import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/animal_repository.dart';
import 'cat_event.dart';
import 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final AnimalRepository _repository = AnimalRepository();

  CatBloc() : super(CatInitialState()) {
    on<GetCatListEvent>((event, emit) async {
      emit(CatLoadingState());
      try {
        final list = await _repository.getCats();
        emit(CatLoadedState(catList: list));
      } catch (e) {
        emit(CatErrorState(errorText: e.toString()));
      }
    });
  }
}
