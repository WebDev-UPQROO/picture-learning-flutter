part of 'settings_cubit.dart';

class SettingsState {
  User? user;
  bool music;
  bool effects;
  Status status;
  MessageUI? message;

  SettingsState({
    this.user,
    this.music = true,
    this.effects = true,
    required this.status,
    this.message,
  });

  SettingsState.initial() : this(status: Status.initial);

  SettingsState copyWith({
    User? user,
    bool? music,
    bool? effects,
    Status? status,
    MessageUI? message,
  }) {
    return SettingsState(
      user: user ?? this.user,
      music: music ?? this.music,
      effects: effects ?? this.effects,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
