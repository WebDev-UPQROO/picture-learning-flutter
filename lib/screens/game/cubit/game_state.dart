part of 'game_cubit.dart';

class GameState {
  String? uid;
  int gameIndex;
  List<Exercise>? exercises;
  Status status;
  MessageUI? message;

  GameState({
    this.uid,
    this.gameIndex = 0,
    this.exercises,
    required this.status,
    this.message,
  });

  GameState.initial() : this(status: Status.initial);

  GameState copyWith({
    String? uid,
    int? gameIndex,
    List<Exercise>? exercises,
    Status? status,
    MessageUI? message,
  }) {
    return GameState(
      uid: uid ?? this.uid,
      gameIndex: gameIndex ?? this.gameIndex,
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
