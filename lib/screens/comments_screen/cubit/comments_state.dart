part of 'comments_cubit.dart';

class CommentsState {
  int stars;
  Status status;
  MessageUI? message;

  CommentsState({
    this.stars = 4,
    required this.status,
    this.message,
  });

  CommentsState.initial() : this(status: Status.initial);

  CommentsState copyWith({
    int? stars,
    Status? status,
    MessageUI? message,
  }) {
    return CommentsState(
      stars: stars ?? this.stars,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
