import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/status.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void example() {
    try {
      emit(state.copyWith(status: Status.loading));

      // Do something

      emit(state.copyWith(
        status: Status.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
