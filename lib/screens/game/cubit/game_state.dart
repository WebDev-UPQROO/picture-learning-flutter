part of 'game_cubit.dart';

class GameState {
  String song = 'assets/audio/game.mp3';
  String success = 'assets/audio/success.mp3';
  String wrong = 'assets/audio/press.wav';

  String? uid;

  String? mesageInitial;
  List<Exercise>? exercises;
  bool backgroundMusic;

  int gameIndex;
  GameStatus gameStatus;
  ProgressStatus progressStatus;

  Status status;
  MessageUI? message;

  GameState({
    this.uid,
    this.mesageInitial,
    this.exercises,
    required this.backgroundMusic,
    this.gameIndex = 0,
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
          backgroundMusic: false,
        );

  GameState copyWith({
    String? uid,
    String? mesageInitial,
    List<Exercise>? exercises,
    bool? backgroundMusic,
    int? gameIndex,
    GameStatus? gameStatus,
    ProgressStatus? progressStatus,
    Status? status,
    MessageUI? message,
  }) {
    return GameState(
      uid: uid ?? this.uid,
      mesageInitial: mesageInitial ?? this.mesageInitial,
      exercises: exercises ?? this.exercises,
      backgroundMusic: backgroundMusic ?? this.backgroundMusic,
      gameIndex: gameIndex ?? this.gameIndex,
      gameStatus: gameStatus ?? this.gameStatus,
      progressStatus: progressStatus ?? this.progressStatus,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
