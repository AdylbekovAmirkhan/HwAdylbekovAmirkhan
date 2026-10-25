import 'package:flutter/material.dart';

class GameState {
  final List<Color> cardColors;
  final List<bool> openedCards;
  final List<int> selectedIndices;
  final int errors;
  final String message;
  final bool isGameOver;

  const GameState({
    required this.cardColors,
    required this.openedCards,
    required this.selectedIndices,
    required this.errors,
    required this.message,
    required this.isGameOver,
  });

  GameState copyWith({
    List<Color>? cardColors,
    List<bool>? openedCards,
    List<int>? selectedIndices,
    int? errors,
    String? message,
    bool? isGameOver,
  }) {
    return GameState(
      cardColors: cardColors ?? this.cardColors,
      openedCards: openedCards ?? this.openedCards,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      errors: errors ?? this.errors,
      message: message ?? this.message,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}
