part of 'game_cubit.dart';

class GameState {
  String song = 'assets/audio/game.mp3';
  String success = 'assets/audio/success.mp3';
  String wrong = 'assets/audio/error.wav';

  String? uid;

  String? mesageInitial;
  List<Exercise>? exercises;
  bool backgroundMusic;
  int correctAnswers;

  int gameIndex;
  ProgressStatus progressStatus;
  bool erroreffect;
  bool optionIsActive;

  Status status;
  MessageUI? message;

  GameState({
    this.uid,
    this.mesageInitial,
    this.exercises,
    required this.backgroundMusic,
    this.correctAnswers = 0,
    this.gameIndex = 0,
    required this.progressStatus,
    this.erroreffect = false,
    this.optionIsActive = true,
    required this.status,
    this.message,
  });

  GameState.initial()
      : this(
          status: Status.initial,
          progressStatus: ProgressStatus.initial,
          backgroundMusic: false,
        );

  GameState copyWith({
    String? uid,
    String? mesageInitial,
    List<Exercise>? exercises,
    bool? backgroundMusic,
    int? correctAnswers,
    int? gameIndex,
    ProgressStatus? progressStatus,
    bool? erroreffect,
    bool? optionIsActive,
    Status? status,
    MessageUI? message,
  }) {
    return GameState(
      uid: uid ?? this.uid,
      mesageInitial: mesageInitial ?? this.mesageInitial,
      exercises: exercises ?? this.exercises,
      backgroundMusic: backgroundMusic ?? this.backgroundMusic,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      gameIndex: gameIndex ?? this.gameIndex,
      progressStatus: progressStatus ?? this.progressStatus,
      erroreffect: erroreffect ?? this.erroreffect,
      optionIsActive: optionIsActive ?? this.optionIsActive,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
