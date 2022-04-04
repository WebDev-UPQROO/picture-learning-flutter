part of 'oauth_cubit.dart';

class OAuthState {
  Status status;
  MessageUI? message;

  // data
  bool firstTime;
  bool? isUser;

  OAuthState({
    required this.status,
    this.message,
    this.firstTime = true,
    this.isUser,
  });

  OAuthState.initial() : this(status: Status.initial);

  OAuthState copyWith({
    Status? status,
    MessageUI? message,
    bool? firstTime,
    bool? isUser,
  }) {
    return OAuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      firstTime: firstTime ?? this.firstTime,
      isUser: isUser ?? this.isUser,
    );
  }
}
