import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/game/exercise.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/screens/game/game_screen.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameService gameService;
  GameCubit(this.gameService) : super(GameState.initial());

  Future<bool> getGame(String uid) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final exercises = await gameService.getExercise(uid);

      emit(state.copyWith(
        uid: uid,
        exercises: exercises,
        status: Status.loaded,
      ));
      return true;
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));

      return false;
    }
  }

  void startGame({
    GameStatus? gameStatus,
    ProgressStatus? progressStatus,
    String? messageInitial,
  }) {
    // Initial Text
    emit(state.copyWith(
      gameStatus: gameStatus,
      progressStatus: progressStatus,
      mesageInitial: messageInitial,
    ));
  }

  void pressOption(String option) {
    if (option == state.exercises?[state.gameIndex].answer) {
      emit(state.copyWith(progressStatus: ProgressStatus.correct));
    } else {
      emit(state.copyWith(progressStatus: ProgressStatus.wrong));
    }
  }
}
