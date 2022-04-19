part of 'oauth_cubit.dart';

class OAuthState {
  Status status;
  MessageUI? message;

  // data
  bool firstTime;

  OAuthState({
    required this.status,
    this.message,
    this.firstTime = true,
  });

  OAuthState.initial() : this(status: Status.initial);

  OAuthState copyWith({
    Status? status,
    MessageUI? message,
    bool? firstTime,
  }) {
    return OAuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      firstTime: firstTime ?? this.firstTime,
    );
  }
}
