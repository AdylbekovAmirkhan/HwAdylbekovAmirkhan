import '../data/models/cat_model.dart';

sealed class CatState {}

final class CatInitialState extends CatState {}

final class CatLoadingState extends CatState {}

final class CatLoadedState extends CatState {
  final List<CatModel> catList;

  CatLoadedState({required this.catList});
}

final class CatErrorState extends CatState {
  final String errorText;

  CatErrorState({this.errorText = 'Ошибка загрузки данных'});
}
