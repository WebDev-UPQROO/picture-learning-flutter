part of 'password_cubit.dart';

class PasswordState {
  Status status;
  MessageUI? message;

  PasswordState({
    required this.status,
    this.message,
  });

  PasswordState.initial() : this(status: Status.initial);

  PasswordState copyWith({
    Status? status,
    MessageUI? message,
  }) {
    return PasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
