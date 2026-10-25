import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(
          GameState(
            cards: [
              const CardModel(id: 1, color: Colors.red),
              const CardModel(id: 2, color: Colors.blue),
              const CardModel(id: 3, color: Colors.red),
              const CardModel(id: 4, color: Colors.blue),
            ]..shuffle(),
            selectedIndices: [],
            errors: 0,
            maxErrors: 1,
            status: GameStatus.playing,
          ),
        );

  void selectCard(int index) async {
    if (state.status != GameStatus.playing) return;
    if (state.cards[index].isMatched || state.cards[index].isOpened) return;
    if (state.selectedIndices.contains(index) || state.selectedIndices.length >= 2) return;

    final updatedCards = List<CardModel>.from(state.cards);
    updatedCards[index] = updatedCards[index].copyWith(isOpened: true);

    final updatedSelection = List<int>.from(state.selectedIndices)..add(index);

    emit(state.copyWith(cards: updatedCards, selectedIndices: updatedSelection));

    if (updatedSelection.length == 2) {
      await Future.delayed(const Duration(milliseconds: 800));
      _checkMatch(updatedSelection);
    }
  }

  void _checkMatch(List<int> selection) {
    if (isClosed) return;

    final firstIndex = selection[0];
    final secondIndex = selection[1];

    final firstCard = state.cards[firstIndex];
    final secondCard = state.cards[secondIndex];

    final updatedCards = List<CardModel>.from(state.cards);

    if (firstCard.color == secondCard.color) {
      updatedCards[firstIndex] = updatedCards[firstIndex].copyWith(isMatched: true, isOpened: true);
      updatedCards[secondIndex] = updatedCards[secondIndex].copyWith(isMatched: true, isOpened: true);

      final isAllMatched = updatedCards.every((card) => card.isMatched);
      emit(state.copyWith(
        cards: updatedCards,
        selectedIndices: [],
        status: isAllMatched ? GameStatus.success : GameStatus.playing,
      ));
    } else {
      final currentErrors = state.errors + 1;
      
      if (currentErrors > state.maxErrors) {
        emit(state.copyWith(
          errors: currentErrors,
          selectedIndices: [],
          status: GameStatus.gameOver,
        ));
      } else {
        updatedCards[firstIndex] = updatedCards[firstIndex].copyWith(isOpened: false);
        updatedCards[secondIndex] = updatedCards[secondIndex].copyWith(isOpened: false);
        
        emit(state.copyWith(
          cards: updatedCards,
          selectedIndices: [],
          errors: currentErrors,
        ));
      }
    }
  }

  void restartGame() {
    emit(
      GameState(
        cards: [
          const CardModel(id: 1, color: Colors.red),
          const CardModel(id: 2, color: Colors.blue),
          const CardModel(id: 3, color: Colors.red),
          const CardModel(id: 4, color: Colors.blue),
        ]..shuffle(),
        selectedIndices: [],
        errors: 0,
        maxErrors: 1,
        status: GameStatus.playing,
      ),
    );
  }
}
