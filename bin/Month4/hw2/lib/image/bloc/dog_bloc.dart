import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:hw2/repository/animal_repository.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final AnimalRepository repository = AnimalRepository();

  DogBloc() : super(Doginitial()) {
    on<LoadDogImageEvent>((event, emit) async {
      try {
        emit(LoadingImgState());
        final String img = await repository.getDogImage();
        emit(LoadedImgState(img: img));
      } catch (e) {
        emit(ErrorImgState());
      }
    });
  }
}
