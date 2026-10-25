import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(
          GameState(
            cardColors: [Colors.red, Colors.blue, Colors.red, Colors.blue]..shuffle(),
            openedCards: [false, false, false, false],
            selectedIndices: [],
            errors: 0,
            message: "Ищи пары карточек!",
            isGameOver: false,
          ),
        );

  void clickCard(int index) async {
    if (state.isGameOver) return;
    if (state.openedCards[index]) return;
    if (state.selectedIndices.length >= 2) return;

    List<bool> newOpened = List.from(state.openedCards);
    newOpened[index] = true;

    List<int> newSelection = List.from(state.selectedIndices)..add(index);

    emit(state.copyWith(openedCards: newOpened, selectedIndices: newSelection));

    if (newSelection.length == 2) {
      await Future.delayed(const Duration(milliseconds: 700));
      _checkCards(newSelection);
    }
  }

  void _checkCards(List<int> selection) {
    if (isClosed) return;

    int idx1 = selection[0];
    int idx2 = selection[1];

    if (state.cardColors[idx1] == state.cardColors[idx2]) {
      bool win = state.openedCards.every((element) => element == true);
      emit(state.copyWith(
        selectedIndices: [],
        message: win ? "Успешно! Все пары найдены." : "Успешно!",
        isGameOver: win,
      ));
    } else {
      int newErrors = state.errors + 1;
      if (newErrors >= 2) {
        emit(state.copyWith(
          errors: newErrors,
          selectedIndices: [],
          message: "У вас не осталось попыток.",
          isGameOver: true,
        ));
      } else {
        List<bool> newOpened = List.from(state.openedCards);
        newOpened[idx1] = false;
        newOpened[idx2] = false;
        emit(state.copyWith(
          openedCards: newOpened,
          selectedIndices: [],
          errors: newErrors,
          message: "Не совпадает! Осталась 1 попытка.",
        ));
      }
    }
  }
}
