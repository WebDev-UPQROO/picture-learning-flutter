part of 'game_cubit.dart';

class GameState {
  Status status;
  MessageUI? message;

  GameState({
    required this.status,
    this.message,
  });

  GameState.initial() : this(status: Status.initial);

  GameState copyWith({
    Status? status,
    MessageUI? message,
  }) {
    return GameState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
