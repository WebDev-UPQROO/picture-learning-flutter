part of 'home_cubit.dart';

class HomeState {
  String press = 'assets/audio/press.wav';
  String music = 'assets/audio/home.mp3';

  Status status;
  MessageUI? message;
  bool? isUser;

  // Data
  User? user;
  List<Field>? fields;

  HomeState({
    required this.status,
    this.message,
    this.isUser,
    this.user,
    this.fields,
  });

  HomeState.initial() : this(status: Status.initial);

  HomeState copyWith({
    Status? status,
    MessageUI? message,
    bool? isUser,
    User? user,
    List<Field>? fields,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      isUser: isUser ?? this.isUser,
      user: user ?? this.user,
      fields: fields ?? this.fields,
    );
  }
}
