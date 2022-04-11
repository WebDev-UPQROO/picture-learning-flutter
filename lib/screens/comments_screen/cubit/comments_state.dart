part of 'comments_cubit.dart';

class CommentsState {
  int stars;
  String? comment;
  Status status;
  MessageUI? message;

  CommentsState({
    this.stars = 4,
    this.comment,
    required this.status,
    this.message,
  });

  CommentsState.initial() : this(status: Status.initial);

  CommentsState copyWith({
    int? stars,
    String? comment,
    Status? status,
    MessageUI? message,
  }) {
    return CommentsState(
      stars: stars ?? this.stars,
      comment: comment ?? this.comment,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
