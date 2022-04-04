part of 'home_cubit.dart';

class HomeState {
  Status status;
  MessageUI? message;

  // Data
  User? user;

  HomeState({
    required this.status,
    this.message,
    this.user,
  });

  HomeState.initial() : this(status: Status.initial);

  HomeState copyWith({
    Status? status,
    MessageUI? message,
    User? user,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
