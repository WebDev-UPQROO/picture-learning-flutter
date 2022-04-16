import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/game/exercise.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/models/status.dart';

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

  void changeQuestion() {}
}
