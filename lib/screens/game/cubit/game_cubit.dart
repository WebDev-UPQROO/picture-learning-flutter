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
      progressStatus: ProgressStatus.playing,
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
    ProgressStatus? progressStatus,
    String? messageInitial,
  }) {
    // Initial Text
    emit(state.copyWith(
      progressStatus: progressStatus,
      mesageInitial: messageInitial,
    ));
  }

  void pressOption(String option) async {
    if (option == state.exercises?[state.gameIndex].answer) {
      emit(state.copyWith(
        progressStatus: ProgressStatus.correct,
        correctAnswers: state.correctAnswers + 1,
        optionIsActive: false,
      ));
      musicCubit.playeffect(state.success);
    } else {
      emit(state.copyWith(
        progressStatus: ProgressStatus.wrong,
        erroreffect: true,
        optionIsActive: false,
      ));
      musicCubit.playeffect(state.wrong);
    }

    await Future.delayed(const Duration(seconds: 1));

    if (!isClosed) {
      if (state.gameIndex >= state.exercises!.length - 1) {
        emit(state.copyWith(
          progressStatus: ProgressStatus.finished,
        ));
        return;
      }

      emit(state.copyWith(
        progressStatus: ProgressStatus.playing,
        gameIndex: state.gameIndex + 1,
        erroreffect: false,
        optionIsActive: true,
      ));
    }
  }

  void finishGame() async {
    try {
      emit(state.copyWith(
        status: Status.loading,
        progressStatus: ProgressStatus.saving,
      ));

      final exercisesLength = state.exercises?.length ?? 0;

      if (state.correctAnswers < exercisesLength * 0.7) {
        emit(state.copyWith(
          status: Status.finished,
        ));
        return;
      }

      final user = await localService.getUser();
      final newUser = await gameService.putGame(user.uid!, [state.uid!]);

      final fields = user.perfectFields?.length ?? 0;
      final newFields = newUser.perfectFields?.length ?? 0;

      localService.putUser(newUser);

      if (newFields > fields) {
        emit(state.copyWith(
          status: Status.saving,
        ));
      } else {
        emit(state.copyWith(
          status: Status.validated,
        ));
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          status: Status.error,
          message: ErrorC.errorHandler(e),
        ));
      }
    }
  }
}
