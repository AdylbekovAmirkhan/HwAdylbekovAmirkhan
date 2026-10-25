import 'package:flutter/material.dart';

enum GameStatus { playing, success, gameOver }

class CardModel {
  final int id;
  final Color color;
  final bool isOpened;
  final bool isMatched;

  const CardModel({
    required this.id,
    required this.color,
    this.isOpened = false,
    this.isMatched = false,
  });

  CardModel copyWith({bool? isOpened, bool? isMatched}) {
    return CardModel(
      id: id,
      color: color,
      isOpened: isOpened ?? this.isOpened,
      isMatched: isMatched ?? this.isMatched,
    );
  }
}

class GameState {
  final List<CardModel> cards;
  final List<int> selectedIndices;
  final int errors;
  final int maxErrors;
  final GameStatus status;

  const GameState({
    required this.cards,
    required this.selectedIndices,
    required this.errors,
    required this.maxErrors,
    required this.status,
  });

  GameState copyWith({
    List<CardModel>? cards,
    List<int>? selectedIndices,
    int? errors,
    GameStatus? status,
  }) {
    return GameState(
      cards: cards ?? this.cards,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      errors: errors ?? this.errors,
      maxErrors: maxErrors,
      status: status ?? this.status,
    );
  }
}
