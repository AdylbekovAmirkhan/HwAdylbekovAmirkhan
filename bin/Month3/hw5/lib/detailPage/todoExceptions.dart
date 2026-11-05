class EmptyTitleException implements Exception {
  final String message = 'Название задачи не может быть пустым';
  @override
  String toString() => message;
}

class ShortTitleException implements Exception {
  final String message = 'и не менее 4 символов';
  @override
  String toString() => message;
}
