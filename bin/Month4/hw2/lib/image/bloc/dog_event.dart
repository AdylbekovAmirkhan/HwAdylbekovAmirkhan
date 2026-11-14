part of 'dog_bloc.dart';

@immutable
sealed class DogEvent {}
final class LoadDogImageEvent extends DogEvent {}
