part of 'example_cubit.dart';

class ExampleState {
  Status status;
  MessageUI? message;

  ExampleState({
    required this.status,
    this.message,
  });

  ExampleState.initial() : this(status: Status.initial);

  ExampleState copyWith({
    Status? status,
    MessageUI? message,
  }) {
    return ExampleState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
