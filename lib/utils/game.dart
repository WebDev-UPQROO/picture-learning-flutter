import 'package:picture_learning/models/game/index.dart';

// Valid if the game is in progress
bool isPlaying(ProgressStatus status) {
  return status != ProgressStatus.initial &&
      status != ProgressStatus.finished &&
      status != ProgressStatus.saving;
}
