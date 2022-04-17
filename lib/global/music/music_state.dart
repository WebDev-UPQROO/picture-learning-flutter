part of 'music_cubit.dart';

class MusicState {
  AudioPlayer backgroundMusic;
  AudioPlayer effects;

  MusicState({
    required this.backgroundMusic,
    required this.effects,
  });

  MusicState copyWith({
    AudioPlayer? backgroundMusic,
    AudioPlayer? effects,
  }) {
    return MusicState(
      backgroundMusic: backgroundMusic ?? this.backgroundMusic,
      effects: effects ?? this.effects,
    );
  }
}
