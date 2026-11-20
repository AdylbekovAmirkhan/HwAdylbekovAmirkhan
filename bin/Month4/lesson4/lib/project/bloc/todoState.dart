import 'package:lesson4/project/model.dart';

sealed class TodoState {}

final class TodoInitialState extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final Todo model;

  TodoLoadedState({required this.model});
}

final class TodoErrorState extends TodoState {
  final String errorText;

  TodoErrorState({this.errorText = "Ошибка"});
}