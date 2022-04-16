part of 'game_cubit.dart';

class GameState {
  String? uid;

  String? mesageInitial;

  int gameIndex;
  List<Exercise>? exercises;
  GameStatus gameStatus;
  ProgressStatus progressStatus;

  Status status;
  MessageUI? message;

  GameState({
    this.uid,
    this.mesageInitial,
    this.gameIndex = 0,
    this.exercises,
    required this.gameStatus,
    required this.progressStatus,
    required this.status,
    this.message,
  });

  GameState.initial()
      : this(
          status: Status.initial,
          gameStatus: GameStatus.initial,
          progressStatus: ProgressStatus.initial,
        );

  GameState copyWith({
    String? uid,
    String? mesageInitial,
    int? gameIndex,
    List<Exercise>? exercises,
    GameStatus? gameStatus,
    ProgressStatus? progressStatus,
    Status? status,
    MessageUI? message,
  }) {
    return GameState(
      uid: uid ?? this.uid,
      mesageInitial: mesageInitial ?? this.mesageInitial,
      gameIndex: gameIndex ?? this.gameIndex,
      exercises: exercises ?? this.exercises,
      gameStatus: gameStatus ?? this.gameStatus,
      progressStatus: progressStatus ?? this.progressStatus,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
