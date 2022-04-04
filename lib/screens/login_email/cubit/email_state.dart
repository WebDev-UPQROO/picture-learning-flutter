part of 'email_cubit.dart';

class EmailState {
  Status status;
  MessageUI? message;

  EmailState({
    required this.status,
    this.message,
  });

  EmailState.initial() : this(status: Status.initial);

  EmailState copyWith({
    Status? status,
    MessageUI? message,
  }) {
    return EmailState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
