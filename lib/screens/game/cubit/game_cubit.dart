import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/models/status.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameService gameService;
  LocalService localService;
  MusicCubit musicCubit;

  GameCubit(
    this.gameService,
    this.localService,
    this.musicCubit,
  ) : super(GameState.initial());

  void updateMusic() {
    if (state.backgroundMusic) {
      musicCubit.playMusic(state.song, state.backgroundMusic);
    } else {
      musicCubit.stopMusic();
    }
  }

  void musicControl() {
    emit(state.copyWith(
      backgroundMusic: !state.backgroundMusic,
      progressStatus: ProgressStatus.initial,
    ));
    updateMusic();
  }

  Future<bool> getGame(String uid) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final exercises = await gameService.getExercise(uid);
      final music = await localService.getBackgroundMusic();

      emit(state.copyWith(
        uid: uid,
        exercises: exercises,
        backgroundMusic: music,
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
    ProgressStatus progressStatus;
    if (option == state.exercises?[state.gameIndex].answer) {
      progressStatus = ProgressStatus.correct;
      musicCubit.playeffect(state.success);
    } else {
      progressStatus = ProgressStatus.wrong;
      musicCubit.playeffect(state.wrong);
    }

    if (state.gameIndex >= state.exercises!.length - 1) {
      emit(state.copyWith(progressStatus: ProgressStatus.finished));
      return;
    }

    emit(state.copyWith(
      progressStatus: progressStatus,
      gameIndex: state.gameIndex + 1,
    ));
  }

  void finishGame() {
    emit(state.copyWith(progressStatus: ProgressStatus.finished));
  }
}
