part of 'dog_bloc.dart';

@immutable
sealed class DogState {}

final class Doginitial extends DogState {}

final class LoadingImgState extends DogState {}

final class ErrorImgState extends DogState {}

final class LoadedImgState extends DogState {
  LoadedImgState({required this.img});

  final String img;
}
